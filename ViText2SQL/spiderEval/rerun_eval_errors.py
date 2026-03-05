"""
Re-run Eval Errors: Takes existing benchmark results and re-runs only entries
that have eval errors (eval_error is not null and not "None").

This sends the original generated_sql as initialSql through the full pipeline
to get a corrected result, then merges back into the original results file.
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
OUTPUT_DIR = os.path.join(BASE_DIR, 'benchmark_tensor_logs')


def has_real_eval_error(entry):
    """Check if an entry has a genuine eval error (not null, not 'None' string)."""
    err = entry.get('eval_error')
    if err is None:
        return False
    if str(err).strip().lower() == 'none':
        return False
    return True


def process_single_rerun(entry, schemas_map, enriched_schemas, api_url, kmaps, stats, total_count, pipeline):
    """Re-run a single entry with eval error through the pipeline."""
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
            'gold_sql': gold_sql, 'error': 'Schema not found',
            'eval_error': entry.get('eval_error')
        }, is_error=True)
        return

    enriched = enriched_schemas.get(db_id) if enriched_schemas else None

    try:
        start_time = time.time()
        gen_sql, plan = bt.call_tensor_api(
            question, None, api_url, db_id,
            schema_obj=enriched, raw_schema=raw_schema,
            pipeline=pipeline, initial_sql=initial_sql
        )
        duration = int((time.time() - start_time) * 1000)

        gen_sql = gen_sql.strip().rstrip(';').strip()

        exact_match, eval_error = bt.run_spider_exact_match(gold_sql, gen_sql, db_id, kmaps)

        is_eval_error = False
        if eval_error and exact_match is None:
            is_eval_error = True
            exact_match = False

        status_icon = "✓ MATCH" if exact_match else "✗ NO MATCH"
        old_error = entry.get('eval_error', '')
        fixed = "FIXED!" if not eval_error and old_error else ""
        print(f"[{entry_id+1}/{total_count}] {status_icon} {fixed} | DB: {db_id} | {duration}ms")
        print(f"  Q: {question}")
        print(f"  Gold: {gold_sql}")
        print(f"  Old:  {initial_sql}")
        print(f"  New:  {gen_sql}")
        if old_error:
            print(f"  Old Error: {old_error}")
        if eval_error:
            print(f"  New Error: {eval_error}")
        print()

        stats.add_result({
            'id': entry_id, 'db_id': db_id, 'question': question,
            'gold_sql': gold_sql, 'generated_sql': gen_sql,
            'exact_match': exact_match, 'eval_error': eval_error,
            'duration_ms': duration,
        }, is_match=exact_match, is_eval_error=is_eval_error)

    except Exception as e:
        print(f"[{entry_id+1}/{total_count}] ✗ Error for id {entry_id}: {e}")
        # Keep original result on failure
        stats.add_result({
            'id': entry_id, 'db_id': db_id, 'question': question,
            'gold_sql': gold_sql, 'generated_sql': initial_sql,
            'exact_match': entry.get('exact_match', False),
            'eval_error': entry.get('eval_error'),
            'error': str(e),
            'duration_ms': entry.get('duration_ms', 0)
        }, is_error=True)


def main():
    parser = argparse.ArgumentParser(description='Re-run entries with eval errors')
    parser.add_argument('--pipeline', type=str, required=True,
                        choices=['base', 'ablation1', 'ablation2', 'ablation3'],
                        help='Pipeline mode (base, ablation1, ablation2, ablation3)')
    parser.add_argument('--workers', type=int, default=4, help='Number of concurrent workers')
    parser.add_argument('--api', type=str, default=bt.TENSOR_API, help='TensorSQL-Node API URL')
    args = parser.parse_args()

    pipeline = args.pipeline
    api_url = args.api
    workers = args.workers

    results_file = os.path.join(OUTPUT_DIR, f'benchmark_results_{pipeline}.json')
    pred_file = os.path.join(OUTPUT_DIR, f'pred_{pipeline}.sql')
    gold_file = os.path.join(OUTPUT_DIR, f'gold_{pipeline}.sql')

    print(f"{'='*60}")
    print(f"  RE-RUN EVAL ERRORS: {pipeline}")
    print(f"  Results: {results_file}")
    print(f"  Workers: {workers}")
    print(f"{'='*60}")

    # Load existing results
    print(f"\n[ReRun] Loading existing results from {results_file}...")
    with open(results_file, 'r', encoding='utf-8') as f:
        all_results = json.load(f)

    # Find entries with eval errors
    error_entries = [e for e in all_results if has_real_eval_error(e)]
    ok_entries = [e for e in all_results if not has_real_eval_error(e)]

    print(f"[ReRun] Total entries in file: {len(all_results)}")
    print(f"[ReRun] RESUME: Found {len(ok_entries)} already successful entries. Skipping.")
    print(f"[ReRun] WORK: Found {len(error_entries)} entries still having eval errors to re-run.")

    if not error_entries:
        print("[ReRun] No eval errors to re-run. Everything is already fixed! Exiting.")
        return

    # Load schemas
    print(f"[ReRun] Loading schemas...")
    tables_data = json.load(open(bt.TABLES_FILE, encoding='utf-8'))
    schemas_map = {s['db_id']: s for s in tables_data}

    kmaps = bt.build_foreign_key_map_from_json(bt.TABLES_FILE)

    # Initialize stats with OK entries pre-loaded
    stats = bt.Stats()
    for entry in ok_entries:
        is_match = entry.get('exact_match', False)
        stats.add_result(entry, is_match=is_match)

    total_count = len(all_results)

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
            print(f"  PROGRESS [{pipeline}]: {total_processed}/{total_count} | EM: {em} ({rate:.1f}%) | Errors: {e}")
            print(f"{'='*60}\n")
            # Save intermediate results
            sorted_results = stats.get_sorted_results()
            json.dump(sorted_results, open(results_file, 'w', encoding='utf-8'), ensure_ascii=False, indent=2)

    progress_thread = threading.Thread(target=progress_reporter, daemon=True)
    progress_thread.start()

    # Run
    start_time_exec = time.time()

    with ThreadPoolExecutor(max_workers=workers) as executor:
        futures = {
            executor.submit(
                process_single_rerun, entry, schemas_map,
                enriched_schemas, api_url, kmaps, stats, total_count, pipeline
            ): entry['id']
            for entry in error_entries
        }

        for future in as_completed(futures):
            entry_id = futures[future]
            try:
                future.result()
            except Exception as e:
                print(f"[Worker] Unexpected crash for id {entry_id}: {e}")

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

    with open(pred_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(pred_lines) + '\n')
    with open(gold_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(gold_lines) + '\n')
    json.dump(results, open(results_file, 'w', encoding='utf-8'), ensure_ascii=False, indent=2)

    # Summary
    s, e, em, ee = stats.get_progress()
    rate = em / max(s, 1) * 100

    # Count how many errors were fixed
    new_error_count = sum(1 for r in results if has_real_eval_error(r))
    fixed_count = len(error_entries) - new_error_count

    print(f"\n{'='*50}")
    print(f"  RE-RUN RESULTS ({pipeline})")
    print(f"{'='*50}")
    print(f"Total entries:       {len(results)}")
    print(f"Success:             {s}")
    print(f"Errors:              {e}")
    print(f"Exact Match:         {em}/{s} ({rate:.1f}%)")
    print(f"Eval errors fixed:   {fixed_count}/{len(error_entries)}")
    print(f"Remaining errors:    {new_error_count}")
    print(f"Execution time:      {elapsed:.0f}s ({elapsed/60:.1f}m)")
    print(f"\nFiles saved:")
    print(f"  {results_file}")
    print(f"  {pred_file}")
    print(f"  {gold_file}")


if __name__ == '__main__':
    main()
