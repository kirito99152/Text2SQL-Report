import os
import sys
import json
import time
import argparse
import requests
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed

# Add spiderEval to path
sys.path.append(os.path.join(os.path.dirname(__file__), 'spiderEval'))
from evaluation import Evaluator, rebuild_sql_val, rebuild_sql_col, build_valid_col_units, build_foreign_key_map_from_json
from process_sql import get_schema, Schema, get_sql

# ============================================================================
# CONFIG
# ============================================================================
BASE_DIR = os.path.dirname(__file__)
DATA_DIR = os.path.join(BASE_DIR, 'data', 'syllable-level')
TABLES_FILE = os.path.join(DATA_DIR, 'tables.json')
DEV_FILE = os.path.join(DATA_DIR, 'dev.json')
TEST_FILE = os.path.join(DATA_DIR, 'test.json')
DB_DIR = os.path.join(DATA_DIR, 'databases')
DB_DIR = os.path.join(DATA_DIR, 'databases')

TENSOR_API = "http://localhost:3000/api/text2sql/generate"

OUTPUT_DIR = os.path.join(BASE_DIR, 'benchmark_tensor_logs')
RESULTS_FILE = os.path.join(OUTPUT_DIR, 'benchmark_results.json')
PRED_FILE = os.path.join(OUTPUT_DIR, 'pred.sql')
GOLD_FILE = os.path.join(OUTPUT_DIR, 'gold.sql')


def build_schema_context(raw_schema):
    """Build schema context text from tables.json entry."""
    context = ""
    for tIdx, table_name in enumerate(raw_schema['table_names']):
        context += f"Table {table_name}:\n"
        for cIdx, col in enumerate(raw_schema['column_names']):
            if col[0] == tIdx:
                col_name = col[1]
                col_type = raw_schema['column_types'][cIdx]
                context += f"  - {col_name} ({col_type})\n"
    return context


def call_tensor_api(question, schema_context, api_url, db_id=None, timeout=600):
    """Call TensorSQL-Node API to generate SQL."""
    payload = {
        "question": question,
        "schemaContext": schema_context,
    }
    if db_id:
        payload["dbId"] = db_id
    
    resp = requests.post(api_url, json=payload, timeout=timeout)
    resp.raise_for_status()
    data = resp.json()
    
    if data.get('status') == 'success':
        return data.get('sql', ''), data.get('plan', '')
    else:
        raise Exception(data.get('error', 'Unknown API error'))


def run_spider_exact_match(gold_sql_str, gen_sql_str, db_id, kmaps):
    """Run Spider original eval_exact_match on a single pair."""
    db_path_flat = os.path.join(DB_DIR, f"{db_id}.sqlite")
    db_path_structured = os.path.join(DB_DIR, db_id, f"{db_id}.sqlite")
    
    if os.path.exists(db_path_flat):
        db_path = db_path_flat
    elif os.path.exists(db_path_structured):
        db_path = db_path_structured
    else:
        return None, "DB not found"
    
    try:
        evaluator = Evaluator()
        schema_data = get_schema(db_path)
        schema = Schema(schema_data)
        
        g_sql = get_sql(schema, gold_sql_str)
        p_sql = get_sql(schema, gen_sql_str)
        
        kmap = kmaps.get(db_id, {})
        
        g_valid = build_valid_col_units(g_sql['from']['table_units'], schema)
        g_sql = rebuild_sql_val(g_sql)
        g_sql = rebuild_sql_col(g_valid, g_sql, kmap)
        
        p_valid = build_valid_col_units(p_sql['from']['table_units'], schema)
        p_sql = rebuild_sql_val(p_sql)
        p_sql = rebuild_sql_col(p_valid, p_sql, kmap)
        
        exact_match = evaluator.eval_exact_match(p_sql, g_sql)
        return bool(exact_match), None
    except Exception as e:
        return False, str(e)


# Thread-safe counters
class Stats:
    def __init__(self):
        self.lock = threading.Lock()
        self.success = 0
        self.errors = 0
        self.exact_matches = 0
        self.eval_errors = 0
        self.results = []
        self.processed_ids = set()
    
    def add_result(self, result, is_match=False, is_error=False, is_eval_error=False):
        with self.lock:
            self.results.append(result)
            if is_error:
                self.errors += 1
            else:
                self.success += 1
            if is_match:
                self.exact_matches += 1
            if is_eval_error:
                self.eval_errors += 1
    
    def get_progress(self):
        with self.lock:
            return self.success, self.errors, self.exact_matches, self.eval_errors


def process_single(i, dev_data, schemas_map, api_url, kmaps, stats, effective_end):
    """Process a single benchmark entry (thread-safe)."""
    test_case = dev_data[i]
    db_id = test_case['db_id']
    question = test_case['question']
    gold_sql = test_case['query']
    raw_schema = schemas_map.get(db_id)
    
    if not raw_schema:
        print(f"[{i+1}/{effective_end}] ✗ Schema not found for db: {db_id}")
        stats.add_result({'id': i, 'db_id': db_id, 'question': question, 'gold_sql': gold_sql, 'error': 'Schema not found'}, is_error=True)
        return
    
    schema_context = build_schema_context(raw_schema)
    
    try:
        start_time = time.time()
        gen_sql, plan = call_tensor_api(question, schema_context, api_url, db_id)
        duration = int((time.time() - start_time) * 1000)
        
        gen_sql = gen_sql.strip().rstrip(';').strip()
        
        exact_match, eval_error = run_spider_exact_match(gold_sql, gen_sql, db_id, kmaps)
        
        is_eval_error = False
        if eval_error and exact_match is None:
            is_eval_error = True
            exact_match = False
        
        status = "✓ MATCH" if exact_match else "✗ NO MATCH"
        print(f"[{i+1}/{effective_end}] {status} | DB: {db_id} | {duration}ms")
        print(f"  Q: {question}")
        print(f"  Gold: {gold_sql}")
        print(f"  Gen:  {gen_sql}")
        if eval_error:
            print(f"  Eval Error: {eval_error}")
        print()
        
        stats.add_result({
            'id': i, 'db_id': db_id, 'question': question,
            'gold_sql': gold_sql, 'generated_sql': gen_sql,
            'exact_match': exact_match, 'eval_error': eval_error,
            'duration_ms': duration
        }, is_match=exact_match, is_eval_error=is_eval_error)
        
    except Exception as e:
        print(f"[{i+1}/{effective_end}] ✗ API Error: {e}")
        stats.add_result({
            'id': i, 'db_id': db_id, 'question': question,
            'gold_sql': gold_sql, 'error': str(e)
        }, is_error=True)


def main():
    parser = argparse.ArgumentParser(description='Benchmark TensorSQL-Node with Spider exact match')
    parser.add_argument('--start', type=int, default=0, help='Start index')
    parser.add_argument('--end', type=int, default=2000, help='End index')
    parser.add_argument('--workers', type=int, default=1, help='Number of concurrent workers')
    parser.add_argument('--api', type=str, default=TENSOR_API, help='TensorSQL-Node API URL')
    parser.add_argument('--dataset', type=str, default='dev', choices=['dev', 'test'], help='Dataset to evaluate on (dev or test)')
    args = parser.parse_args()
    
    api_url = args.api
    
    print(f"[Benchmark] Loading data...")
    tables_data = json.load(open(TABLES_FILE, encoding='utf-8'))
    dataset_file = DEV_FILE if args.dataset == 'dev' else TEST_FILE
    if not os.path.exists(dataset_file):
        print(f"[Benchmark] Error: Dataset file not found at {dataset_file}")
        sys.exit(1)
        
    dev_data = json.load(open(dataset_file, encoding='utf-8'))
    
    schemas_map = {}
    for schema in tables_data:
        schemas_map[schema['db_id']] = schema
    
    kmaps = build_foreign_key_map_from_json(TABLES_FILE)
    
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    
    # Load existing results for resume
    stats = Stats()
    if os.path.exists(RESULTS_FILE):
        try:
            old_results = json.load(open(RESULTS_FILE, encoding='utf-8'))
            good_results = [r for r in old_results if r.get('generated_sql') is not None and not r.get('error')]
            stats.results = good_results
            stats.processed_ids = {r['id'] for r in good_results}
            stats.success = len(good_results)
            stats.exact_matches = sum(1 for r in good_results if r.get('exact_match'))
            print(f"[Benchmark] Loaded {len(good_results)} existing successful results (resume mode)")
        except:
            pass
    
    effective_end = min(len(dev_data), args.end)
    total = effective_end - args.start
    
    # Build work queue (skip already processed)
    work_items = [i for i in range(args.start, effective_end) if i not in stats.processed_ids]
    
    print(f"[Benchmark] Processing {args.start} to {effective_end - 1} ({total} entries, {len(work_items)} remaining)")
    print(f"[Benchmark] API: {api_url}")
    print(f"[Benchmark] Workers: {args.workers}")
    print(f"[Benchmark] Pipeline: Planning → SQL Gen → Self-Check")
    print()
    
    # Progress reporter thread
    stop_progress = threading.Event()
    
    def progress_reporter():
        while not stop_progress.is_set():
            stop_progress.wait(30)  # Report every 30 seconds
            if stop_progress.is_set():
                break
            s, e, em, ee = stats.get_progress()
            total_done = s + e
            rate = em / max(s, 1) * 100
            print(f"\n{'='*60}")
            print(f"  PROGRESS: {total_done}/{len(work_items) + stats.success} | EM: {em}/{s} ({rate:.1f}%) | Errors: {e}")
            print(f"{'='*60}\n")
            # Save intermediate results
            with stats.lock:
                sorted_results = sorted(stats.results, key=lambda x: x['id'])
                json.dump(sorted_results, open(RESULTS_FILE, 'w', encoding='utf-8'), ensure_ascii=False, indent=2)
    
    progress_thread = threading.Thread(target=progress_reporter, daemon=True)
    progress_thread.start()
    
    # Run with ThreadPoolExecutor
    start_time = time.time()
    
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(process_single, i, dev_data, schemas_map, api_url, kmaps, stats, effective_end): i
            for i in work_items
        }
        
        for future in as_completed(futures):
            idx = futures[future]
            try:
                future.result()
            except Exception as e:
                print(f"[Worker] Unexpected error for index {idx}: {e}")
    
    stop_progress.set()
    elapsed = time.time() - start_time
    
    # Final save
    with stats.lock:
        results = sorted(stats.results, key=lambda x: x['id'])
    
    pred_lines = []
    gold_lines = []
    for r in results:
        pred_lines.append(r.get('generated_sql', 'SELECT 1'))
        gold_lines.append(f"{r['gold_sql']}\t{r['db_id']}")
    
    with open(PRED_FILE, 'w', encoding='utf-8') as f:
        f.write('\n'.join(pred_lines) + '\n')
    with open(GOLD_FILE, 'w', encoding='utf-8') as f:
        f.write('\n'.join(gold_lines) + '\n')
    json.dump(results, open(RESULTS_FILE, 'w', encoding='utf-8'), ensure_ascii=False, indent=2)
    
    # Final summary
    s, e, em, ee = stats.get_progress()
    rate = em / max(s, 1) * 100
    
    print(f"\n{'='*50}")
    print(f"  BENCHMARK RESULTS (Spider Exact Match)")
    print(f"{'='*50}")
    print(f"Total processed:     {s + e}")
    print(f"API success:         {s}")
    print(f"API errors:          {e}")
    print(f"Eval parse errors:   {ee}")
    print(f"Exact Match:         {em}/{s} ({rate:.1f}%)")
    print(f"Elapsed:             {elapsed:.0f}s ({elapsed/60:.1f}m)")
    print(f"\nFiles saved:")
    print(f"  {RESULTS_FILE}")
    print(f"  {PRED_FILE}")
    print(f"  {GOLD_FILE}")
    print(f"\nFor official Spider eval:")
    print(f"  python spiderEval/evaluation.py --gold {GOLD_FILE} --pred {PRED_FILE} --db {DB_DIR} --table {TABLES_FILE} --etype match")


if __name__ == '__main__':
    main()

