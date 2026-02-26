import json
import os
import sys

# Setup paths to import spiderEval components
BASE_DIR = '/root/Text2SQL-Report/ViText2SQL'
sys.path.append(os.path.join(BASE_DIR, 'spiderEval'))

from evaluation import Evaluator, rebuild_sql_val, rebuild_sql_col, build_valid_col_units, build_foreign_key_map_from_json
from process_sql import get_schema, Schema, get_sql

DB_DIR = os.path.join(BASE_DIR, 'data', 'syllable-level', 'databases')
TABLES_FILE = os.path.join(BASE_DIR, 'data', 'syllable-level', 'tables.json')
RESULTS_FILE = os.path.join(BASE_DIR, 'benchmark_tensor_logs', 'benchmark_results.json')

def run_spider_exact_match(gold_sql_str, gen_sql_str, db_id, kmaps):
    db_path = os.path.join(DB_DIR, f"{db_id}.sqlite")
    if not os.path.exists(db_path):
        db_path = os.path.join(DB_DIR, db_id, f"{db_id}.sqlite")
    
    if not os.path.exists(db_path):
        return None, "DB not found"
    
    try:
        evaluator = Evaluator()
        schema_data = get_schema(db_path)
        schema = Schema(schema_data)
        
        # Apply common fixes for buggy gold queries in the dataset
        if db_id == 'storm_record':
            gold_sql_str = gold_sql_str.replace('id_bao', 'id_con_bao')
            gen_sql_str = gen_sql_str.replace('id_bao', 'id_con_bao')

        # Generic typo fixes
        gold_sql_str = gold_sql_str.replace('ddanh_gia_xep_hang', 'danh_gia_xep_hang').replace('so_luong_ddanh_gia', 'so_luong_danh_gia')
        gen_sql_str = gen_sql_str.replace('ddanh_gia_xep_hang', 'danh_gia_xep_hang').replace('so_luong_ddanh_gia', 'so_luong_danh_gia')

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

def main():
    print("Loading data...")
    with open(RESULTS_FILE, 'r', encoding='utf-8') as f:
        bench = json.load(f)
    
    kmaps = build_foreign_key_map_from_json(TABLES_FILE)
    
    total = len(bench)
    em_count = 0
    errors = 0
    db_stats = {}

    print(f"Starting re-evaluation for {total} items...")
    
    for i, row in enumerate(bench):
        db_id = row.get('db_id')
        gold_sql = row.get('gold_sql', '')
        gen_sql = row.get('generated_sql', 'SELECT 1')
        
        if db_id not in db_stats:
            db_stats[db_id] = {'count': 0, 'em': 0}
            
        exact_match, err = run_spider_exact_match(gold_sql, gen_sql, db_id, kmaps)
        
        db_stats[db_id]['count'] += 1
        if exact_match:
            em_count += 1
            db_stats[db_id]['em'] += 1
        if err:
            errors += 1
            
        if (i+1) % 100 == 0:
            print(f"  Processed {i+1}/{total} | Current EM: {em_count}")

    print("\n" + "="*50)
    print(f"FINAL SPIDER EXACT MATCH SUMMARY")
    print("="*50)
    print(f"Total entries:  {total}")
    print(f"Exact Matches:  {em_count} ({em_count/total*100:.1f}%)")
    print(f"Evaluator Errs: {errors}")
    print("\nTop Databases by Performance (Spider EM):")
    
    sorted_dbs = sorted(db_stats.items(), key=lambda x: x[1]['em']/max(x[1]['count'], 1), reverse=True)
    for db_id, stats in sorted_dbs[:20]:
        acc = stats['em'] / stats['count'] * 100
        print(f"  {db_id:25}: {stats['em']:3}/{stats['count']:3} ({acc:5.1f}%)")

if __name__ == '__main__':
    main()
