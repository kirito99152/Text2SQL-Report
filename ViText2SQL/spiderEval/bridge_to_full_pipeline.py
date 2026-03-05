"""
Bridge to Full Pipeline: Takes ablation2 results (no self-check) and runs them
through the full base pipeline (Self-Check + Execution-Correction).

Outputs to benchmark_results_base.json with resume support and real-time logging.
"""
import os
import sys
import json
import time
import argparse
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed

# Add current directory to path
sys.path.append(os.path.dirname(__file__))
import benchmark_tensor as bt

# ============================================================================
# CONFIG
# ============================================================================
BASE_DIR = os.path.dirname(os.path.dirname(__file__))
DATA_DIR = os.path.join(BASE_DIR, 'data', 'syllable-level')
TEST_FILE = os.path.join(DATA_DIR, 'test.json')

INPUT_JSON = os.path.join(BASE_DIR, 'benchmark_tensor_logs', 'benchmark_results_ablation2.json')
OUTPUT_DIR = os.path.join(BASE_DIR, 'benchmark_tensor_logs')
RESULTS_FILE = os.path.join(OUTPUT_DIR, 'benchmark_results_base.json')
PRED_FILE = os.path.join(OUTPUT_DIR, 'pred_base.sql')
GOLD_FILE = os.path.join(OUTPUT_DIR, 'gold_base.sql')


def process_single_bridge(i, ablation_data, schemas_map, enriched_schemas, api_url, kmaps, stats, total_count):
    """Process a single bridge entry using pre-existing SQL."""
    entry = ablation_data[i]
    entry_id = entry['id']
    db_id = entry['db_id']
    question = entry['question']
    initial_sql = entry.get('generated_sql', '')
    gold_sql = entry['gold_sql']
    raw_schema = schemas_map.get(db_id)

    if not raw_schema:
        print(f"[{entry_id+1}/{total_count}] ✗ Schema not found for db: {db_id}")
        stats.add_result({
            'id': entry_id, 'db_id': db_id, 'question': question,
            'gold_sql': gold_sql, 'error': 'Schema not found'
        }, is_error=True)
        return

    enriched = enriched_schemas.get(db_id) if enriched_schemas else None

    try:
        start_time = time.time()
        gen_sql, plan = bt.call_tensor_api(
            question, None, api_url, db_id,
            schema_obj=enriched, raw_schema=raw_schema,
            pipeline='base', initial_sql=initial_sql
        )
        duration = int((time.time() - start_time) * 1000)

        gen_sql = gen_sql.strip().rstrip(';').strip()

        exact_match, eval_error = bt.run_spider_exact_match(gold_sql, gen_sql, db_id, kmaps)

        is_eval_error = False
        if eval_error and exact_match is None:
            is_eval_error = True
            exact_match = False

        status = "✓ MATCH" if exact_match else "✗ NO MATCH"
        print(f"[{entry_id+1}/{total_count}] {status} | DB: {db_id} | {duration}ms")
        print(f"  Q: {question}")
        print(f"  Gold: {gold_sql}")
        print(f"  Gen:  {gen_sql}")
        if eval_error:
            print(f"  Eval Error: {eval_error}")
        print()

        total_duration = entry.get('duration_ms', 0) + duration

        stats.add_result({
            'id': entry_id, 'db_id': db_id, 'question': question,
            'gold_sql': gold_sql, 'generated_sql': gen_sql,
            'exact_match': exact_match, 'eval_error': eval_error,
            'duration_ms': total_duration,
        }, is_match=exact_match, is_eval_error=is_eval_error)

    except Exception as e:
        print(f"[{entry_id+1}/{total_count}] ✗ Error for id {entry_id}: {e}")
        stats.add_result({
            'id': entry_id, 'db_id': db_id, 'question': question,
            'gold_sql': gold_sql, 'error': str(e)
        }, is_error=True)


def main():
    parser = argparse.ArgumentParser(description='Bridge ablation2 results to full base pipeline')
    parser.add_argument('--workers', type=int, default=4, help='Number of concurrent workers')
    parser.add_argument('--api', type=str, default=bt.TENSOR_API, help='TensorSQL-Node API URL')
    args = parser.parse_args()

    api_url = args.api
    workers = args.workers

    print(f"{'='*60}")
    print(f"  BRIDGE TO FULL PIPELINE")
    print(f"  Input:   {INPUT_JSON}")
    print(f"  Output:  {RESULTS_FILE}")
    print(f"  Workers: {workers}")
    print(f"{'='*60}")

    # Load input data
    print(f"\n[Bridge] Loading input data from {INPUT_JSON}...")
    with open(INPUT_JSON, 'r', encoding='utf-8') as f:
        ablation_data = json.load(f)

    # Load schemas
    print(f"[Bridge] Loading schemas...")
    tables_data = json.load(open(bt.TABLES_FILE, encoding='utf-8'))
    schemas_map = {s['db_id']: s for s in tables_data}

    # Load reference gold queries
    print(f"[Bridge] Loading reference gold queries from {TEST_FILE}...")
    with open(TEST_FILE, 'r', encoding='utf-8') as f:
        test_data = json.load(f)
    test_lookup = {i: entry['query'] for i, entry in enumerate(test_data)}

    # Sync gold_sql
    sync_count = 0
    for entry in ablation_data:
        ref_query = test_lookup.get(entry['id'])
        if ref_query and entry.get('gold_sql') != ref_query:
            entry['gold_sql'] = ref_query
            sync_count += 1
    if sync_count > 0:
        print(f"[Bridge] Synced {sync_count} gold_sql entries from test.json.")

    kmaps = bt.build_foreign_key_map_from_json(bt.TABLES_FILE)

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # Load existing results for resume
    stats = bt.Stats()
    if os.path.exists(RESULTS_FILE):
        try:
            all_results = json.load(open(RESULTS_FILE, encoding='utf-8'))
            stats.results_map = {r['id']: r for r in all_results}
            stats.processed_ids = {r['id'] for r in all_results if not r.get('error') and r.get('generated_sql')}
            stats.success = sum(1 for r in all_results if not r.get('error') and r.get('generated_sql'))
            stats.errors = sum(1 for r in all_results if r.get('error'))
            stats.exact_matches = sum(1 for r in all_results if not r.get('error') and r.get('exact_match'))

            re_run_count = len(stats.results_map) - len(stats.processed_ids)
            print(f"[Bridge] Loaded {len(all_results)} previous results.")
            print(f"[Bridge] Successfully processed: {len(stats.processed_ids)}")
            if re_run_count > 0:
                print(f"[Bridge] Found {re_run_count} failed results that will be re-run.")
        except Exception as e:
            print(f"[Bridge] Warning: Could not load previous results: {e}")

    total_count = len(ablation_data)

    # Build work queue (skip already processed successful ones)
    work_items = [i for i in range(total_count) if ablation_data[i]['id'] not in stats.processed_ids]

    skipped = total_count - len(work_items)
    retries = sum(1 for i in work_items if ablation_data[i]['id'] in stats.results_map)
    new_items = len(work_items) - retries

    print(f"\n[Bridge] Total entries: {total_count}")
    if skipped > 0:
        print(f"[Bridge] RESUME: Skipping {skipped} already processed items.")
    if retries > 0:
        print(f"[Bridge] RETRY: Re-running {retries} failed/incomplete items.")
    print(f"[Bridge] NEW: Processing {new_items} fresh items.")
    print(f"[Bridge] Total Work Queue: {len(work_items)}")
    print(f"[Bridge] API: {api_url}")
    print()

    # Pre-enrich schemas
    enriched_schemas = bt.pre_enrich_schemas(schemas_map, api_url, num_workers=workers)

    # Progress reporter thread
    stop_progress = threading.Event()

    def progress_reporter():
        while not stop_progress.is_set():
            stop_progress.wait(30)
            if stop_progress.is_set():
                break
            s, e, em, ee = stats.get_progress()
            total_processed = s + e
            rate = em / max(s, 1) * 100
            print(f"\n{'='*60}")
            print(f"  PROGRESS: {total_processed}/{total_count} | Success: {s} | EM: {em} ({rate:.1f}%) | Errors: {e}")
            print(f"{'='*60}\n")
            # Save intermediate results
            sorted_results = stats.get_sorted_results()
            json.dump(sorted_results, open(RESULTS_FILE, 'w', encoding='utf-8'), ensure_ascii=False, indent=2)

    progress_thread = threading.Thread(target=progress_reporter, daemon=True)
    progress_thread.start()

    # Run with ThreadPoolExecutor
    start_time_exec = time.time()

    with ThreadPoolExecutor(max_workers=workers) as executor:
        futures = {
            executor.submit(
                process_single_bridge, i, ablation_data, schemas_map,
                enriched_schemas, api_url, kmaps, stats, total_count
            ): i
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
    print(f"  BRIDGE RESULTS (Base Pipeline)")
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
