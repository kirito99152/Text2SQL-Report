import os
import sys
import json
import time
import argparse
import requests
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed

# Add current directory to path (where evaluation.py and process_sql.py are)
sys.path.append(os.path.dirname(__file__))
from evaluation import Evaluator, rebuild_sql_val, rebuild_sql_col, build_valid_col_units, build_foreign_key_map_from_json
from process_sql import get_schema, Schema, get_sql

# ============================================================================
# CONFIG
# ============================================================================
# BASE_DIR is now the project root (one level up from spiderEval)
BASE_DIR = os.path.dirname(os.path.dirname(__file__))
DATA_DIR = os.path.join(BASE_DIR, 'data', 'syllable-level')
TABLES_FILE = os.path.join(DATA_DIR, 'tables.json')
DEV_FILE = os.path.join(DATA_DIR, 'dev.json')
TEST_FILE = os.path.join(DATA_DIR, 'test.json')
DB_DIR = os.path.join(DATA_DIR, 'databases')

TENSOR_API = "http://host.docker.internal:5002/api/text2sql/generate"

OUTPUT_DIR = os.path.join(BASE_DIR, 'benchmark_tensor_logs')
RESULTS_FILE = os.path.join(OUTPUT_DIR, 'benchmark_results.json')
PRED_FILE = os.path.join(OUTPUT_DIR, 'pred.sql')
GOLD_FILE = os.path.join(OUTPUT_DIR, 'gold.sql')


def build_schema_context(raw_schema):
    """Build schema context text from tables.json entry including foreign keys."""
    context = ""
    for tIdx, table_name in enumerate(raw_schema['table_names']):
        context += f"Table {table_name}:\n"
        for cIdx, col in enumerate(raw_schema['column_names']):
            if col[0] == tIdx:
                col_name = col[1]
                col_type = raw_schema['column_types'][cIdx]
                context += f"  - {col_name} ({col_type})\n"
    
    if raw_schema.get('foreign_keys'):
        context += "\nForeign Keys:\n"
        for src_idx, tgt_idx in raw_schema['foreign_keys']:
            src_table_idx, src_col_name = raw_schema['column_names'][src_idx]
            tgt_table_idx, tgt_col_name = raw_schema['column_names'][tgt_idx]
            src_table = raw_schema['table_names'][src_table_idx]
            tgt_table = raw_schema['table_names'][tgt_table_idx]
            context += f"  - {src_table}.{src_col_name} = {tgt_table}.{tgt_col_name}\n"
    return context


def schema_linking(question, raw_schema):
    """Match Vietnamese question tokens against schema elements using column_names_original and table_names_original.
    Returns a text section with linking hints for the model."""
    import re
    
    # Normalize question: lowercase, remove punctuation except Vietnamese chars
    q_lower = question.lower().strip()
    # Remove punctuation but keep Vietnamese characters
    q_clean = re.sub(r'[.,;:!?\(\)\[\]\{\}\"\'`]', ' ', q_lower)
    q_tokens = q_clean.split()
    
    # Build lookup from original names (Vietnamese syllable-level) to schema names
    table_originals = raw_schema.get('table_names_original', [])
    table_names = raw_schema.get('table_names', [])
    col_originals = raw_schema.get('column_names_original', [])
    col_names = raw_schema.get('column_names', [])
    
    matched = []
    matched_set = set()  # avoid duplicates
    
    # Match table names: try longest match first
    table_phrases = []
    for tIdx, orig in enumerate(table_originals):
        if orig and orig != '*':
            orig_lower = orig.lower()
            table_phrases.append((orig_lower, tIdx, table_names[tIdx]))
    # Sort by length descending for greedy matching
    table_phrases.sort(key=lambda x: -len(x[0]))
    
    for orig_lower, tIdx, tname in table_phrases:
        if orig_lower in q_clean:
            key = f"table:{tname}"
            if key not in matched_set:
                matched.append(f'- "{orig_lower}" → {tname} (bảng)')
                matched_set.add(key)
    
    # Match column names: try longest match first
    col_phrases = []
    for cIdx, orig_pair in enumerate(col_originals):
        if orig_pair[0] == -1:
            continue
        orig_name = orig_pair[1]
        if orig_name and orig_name != '*':
            orig_lower = orig_name.lower()
            tIdx = orig_pair[0]
            col_sql_name = col_names[cIdx][1] if cIdx < len(col_names) else orig_name
            t_sql_name = table_names[tIdx] if tIdx < len(table_names) else '?'
            col_phrases.append((orig_lower, t_sql_name, col_sql_name, cIdx))
    # Sort by token count then length descending for greedy matching
    col_phrases.sort(key=lambda x: (-len(x[0].split()), -len(x[0])))
    
    for orig_lower, t_sql_name, col_sql_name, cIdx in col_phrases:
        # Only match multi-word or distinctive column names (skip generic ones like "id", "tên")
        orig_tokens = orig_lower.split()
        if len(orig_tokens) < 2 and orig_lower in ('id', 'tên', 'năm', 'ngày', 'số'):
            continue
        
        if orig_lower in q_clean:
            key = f"col:{t_sql_name}.{col_sql_name}"
            if key not in matched_set:
                # Check if PK/FK
                pk_keys = set(raw_schema.get('primary_keys', []))
                fk_map = {pair[0]: pair[1] for pair in raw_schema.get('foreign_keys', [])}
                
                suffix = ""
                if cIdx in pk_keys:
                    suffix = " [PK]"
                elif cIdx in fk_map:
                    target_idx = fk_map[cIdx]
                    if target_idx < len(col_names):
                        target_t_idx = col_names[target_idx][0]
                        target_col = col_names[target_idx][1]
                        target_table = table_names[target_t_idx] if target_t_idx < len(table_names) else '?'
                        suffix = f" [FK→{target_table}.{target_col}]"
                
                matched.append(f'- "{orig_lower}" → {t_sql_name}.{col_sql_name}{suffix}')
                matched_set.add(key)
    
    if not matched:
        return ""
    
    return "SCHEMA LINKING (matched question tokens → schema):\n" + "\n".join(matched)


def convert_to_tensor_schema(raw_schema):
    """Convert Spider tables.json entry to TensorSQL-Node structured schema format."""
    tables = []
    primary_keys = set(raw_schema.get('primary_keys', []))
    
    # Build FK lookup: col_index -> True
    fk_cols = set()
    for src_idx, tgt_idx in raw_schema.get('foreign_keys', []):
        fk_cols.add(src_idx)
    
    for tIdx, table_name in enumerate(raw_schema['table_names']):
        columns = []
        for cIdx, col in enumerate(raw_schema['column_names']):
            if col[0] == tIdx:
                columns.append({
                    "name": col[1],
                    "dataType": raw_schema['column_types'][cIdx],
                    "isPrimaryKey": cIdx in primary_keys,
                    "isForeignKey": cIdx in fk_cols,
                })
        tables.append({
            "name": table_name,
            "schema": "dbo",
            "columns": columns,
        })
    
    # Build relationships
    relationships = []
    for src_idx, tgt_idx in raw_schema.get('foreign_keys', []):
        src_table_idx, src_col_name = raw_schema['column_names'][src_idx]
        tgt_table_idx, tgt_col_name = raw_schema['column_names'][tgt_idx]
        relationships.append({
            "fkTable": raw_schema['table_names'][src_table_idx],
            "fkColumn": src_col_name,
            "pkTable": raw_schema['table_names'][tgt_table_idx],
            "pkColumn": tgt_col_name,
        })
    
    return {"tables": tables, "relationships": relationships}


def pre_enrich_schemas(schemas_map, api_url, num_workers=1):
    """Pre-enrich all unique schemas by calling the API with onlyEnrich=true.
    This generates and caches descriptions for all tables before the benchmark."""
    enriched_schemas = {}
    lock = threading.Lock()
    unique_db_ids = list(schemas_map.keys())
    total = len(unique_db_ids)
    print(f"[Benchmark] Pre-enriching {total} schemas with {num_workers} workers...")
    
    def enrich_one(idx_dbid):
        idx, db_id = idx_dbid
        raw_schema = schemas_map[db_id]
        tensor_schema = convert_to_tensor_schema(raw_schema)
        
        try:
            payload = {
                "question": "test",
                "schema": tensor_schema,
                "onlyEnrich": True,
            }
            resp = requests.post(api_url, json=payload, timeout=300)
            resp.raise_for_status()
            data = resp.json()
            
            result = data.get('enrichedSchema', tensor_schema)
            status = "✓" if data.get('enrichedSchema') else "⚠"
            print(f"  [{idx+1}/{total}] {status} Enriched: {db_id}")
            
        except Exception as e:
            print(f"  [{idx+1}/{total}] ✗ Failed to enrich {db_id}: {e}")
            result = tensor_schema
        
        with lock:
            enriched_schemas[db_id] = result
    
    with ThreadPoolExecutor(max_workers=num_workers) as executor:
        executor.map(enrich_one, enumerate(unique_db_ids))
    
    print(f"[Benchmark] Pre-enrichment complete. {len(enriched_schemas)} schemas ready.")
    return enriched_schemas


def call_tensor_api(question, schema_context, api_url, db_id=None, timeout=1000, schema_obj=None, raw_schema=None):
    """Call TensorSQL-Node API to generate SQL with retries on 500 errors."""
    payload = {"question": question}
    
    if schema_obj:
        payload["schema"] = schema_obj
    elif schema_context:
        payload["schemaContext"] = schema_context
    elif raw_schema:
        payload["schemaContext"] = build_schema_context(raw_schema)
    
    if db_id:
        payload["dbId"] = db_id
    
    max_retries = 3
    retry_delay = 2 # seconds
    
    for attempt in range(max_retries + 1):
        try:
            resp = requests.post(api_url, json=payload, timeout=timeout)
            resp.raise_for_status()
            data = resp.json()
            
            if data.get('status') == 'success':
                return data.get('sql', ''), data.get('plan', '')
            else:
                raise Exception(data.get('error', 'Unknown API error'))
        except requests.exceptions.HTTPError as e:
            if resp.status_code == 500 and attempt < max_retries:
                print(f"  [Retry {attempt+1}/{max_retries}] 500 Error encountered, retrying in {retry_delay}s...")
                time.sleep(retry_delay)
                retry_delay *= 2 # Exponential backoff
                continue
            raise e
        except Exception as e:
            if attempt < max_retries:
                print(f"  [Retry {attempt+1}/{max_retries}] Error encountered: {e}, retrying in {retry_delay}s...")
                time.sleep(retry_delay)
                retry_delay *= 2
                continue
            raise e


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
        self.results_map = {} # map id -> result
        self.processed_ids = set()
    
    def add_result(self, result, is_match=False, is_error=False, is_eval_error=False):
        with self.lock:
            res_id = result['id']
            # If we are replacing an existing result, update counters accordingly
            old_res = self.results_map.get(res_id)
            if old_res:
                if old_res.get('error'):
                    # We don't decrement self.errors here because we are about to add the new outcome
                    pass
                else:
                    self.success -= 1
                    if old_res.get('exact_match'):
                        self.exact_matches -= 1
                    # Note: eval_errors decrement is tricky without more state, 
                    # but usually failures don't have eval results anyway.

            self.results_map[res_id] = result
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

    def get_sorted_results(self):
        with self.lock:
            return sorted(self.results_map.values(), key=lambda x: x['id'])


def process_single(i, dev_data, schemas_map, enriched_schemas, api_url, kmaps, stats, effective_end):
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
    
    # Use enriched schema if available, otherwise fallback to text context
    enriched = enriched_schemas.get(db_id) if enriched_schemas else None
    
    try:
        start_time = time.time()
        gen_sql, plan = call_tensor_api(question, None, api_url, db_id, schema_obj=enriched, raw_schema=raw_schema)
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
        print(f"[{i+1}/{effective_end}] ✗ Error for index {i}: {e}")
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
            all_results = json.load(open(RESULTS_FILE, encoding='utf-8'))
            stats.results_map = {r['id']: r for r in all_results}
            
            # processed_ids are only those that were successful
            # We explicitly want to re-run anything that has an 'error' field
            stats.processed_ids = {r['id'] for r in all_results if not r.get('error') and r.get('generated_sql')}
            
            stats.success = sum(1 for r in all_results if not r.get('error') and r.get('generated_sql'))
            stats.errors = sum(1 for r in all_results if r.get('error'))
            stats.exact_matches = sum(1 for r in all_results if not r.get('error') and r.get('exact_match'))
            
            re_run_count = len(stats.results_map) - len(stats.processed_ids)
            print(f"[Benchmark] Loaded {len(all_results)} previous results.")
            print(f"[Benchmark] Successfully processed: {len(stats.processed_ids)}")
            if re_run_count > 0:
                print(f"[Benchmark] Found {re_run_count} failed results that will be re-run.")
        except Exception as e:
            print(f"[Benchmark] Warning: Could not load previous results: {e}")
            pass
    
    effective_end = min(len(dev_data), args.end)
    total = effective_end - args.start
    
    # Build work queue (skip already processed successful ones)
    work_items = [i for i in range(args.start, effective_end) if i not in stats.processed_ids]
    
    print(f"[Benchmark] Processing range {args.start} to {effective_end - 1} ({total} total)")
    print(f"[Benchmark] Queue size (including re-runs): {len(work_items)}")
    print(f"[Benchmark] API: {api_url}")
    print(f"[Benchmark] Workers: {args.workers}")
    print()
    
    # Pre-enrich schemas (generate descriptions)
    enriched_schemas = pre_enrich_schemas(schemas_map, api_url, num_workers=args.workers)
    
    # Progress reporter thread
    stop_progress = threading.Event()
    
    def progress_reporter():
        while not stop_progress.is_set():
            stop_progress.wait(30)  # Report every 30 seconds
            if stop_progress.is_set():
                break
            s, e, em, ee = stats.get_progress()
            total_processed = s + e
            rate = em / max(s, 1) * 100
            print(f"\n{'='*60}")
            print(f"  PROGRESS: {total_processed} items | Success: {s} | EM: {em} ({rate:.1f}%) | Errors: {e}")
            print(f"{'='*60}\n")
            # Save intermediate results
            sorted_results = stats.get_sorted_results()
            json.dump(sorted_results, open(RESULTS_FILE, 'w', encoding='utf-8'), ensure_ascii=False, indent=2)
    
    progress_thread = threading.Thread(target=progress_reporter, daemon=True)
    progress_thread.start()
    
    # Run with ThreadPoolExecutor
    start_time_exec = time.time()
    
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(process_single, i, dev_data, schemas_map, enriched_schemas, api_url, kmaps, stats, effective_end): i
            for i in work_items
        }
        
        for future in as_completed(futures):
            idx = futures[future]
            try:
                future.result()
            except Exception as e:
                print(f"[Worker] Unexpected crash for index {idx}: {e}")
    
    stop_progress.set()
    elapsed = time.time() - start_time_exec
    
    # Final save
    results = stats.get_sorted_results()
    
    pred_lines = []
    gold_lines = []
    for r in results:
        # We only generate files for successful results in the current run or previous runs
        if r.get('generated_sql'):
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
    print(f"Total entries in map: {len(results)}")
    print(f"Current success:     {s}")
    print(f"Current errors:      {e}")
    print(f"Exact Match:         {em}/{s} ({rate:.1f}%)")
    print(f"Execution time:      {elapsed:.0f}s ({elapsed/60:.1f}m)")
    print(f"\nFiles saved:")
    print(f"  {RESULTS_FILE}")
    print(f"  {PRED_FILE}")
    print(f"  {GOLD_FILE}")


if __name__ == '__main__':
    main()

