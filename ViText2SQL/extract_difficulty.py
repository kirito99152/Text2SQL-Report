import json
import os
import sys

BASE_DIR = '/root/Text2SQL-Report/ViText2SQL'
sys.path.append(os.path.join(BASE_DIR, 'spiderEval'))

from evaluation import Evaluator, rebuild_sql_val, rebuild_sql_col, build_valid_col_units, build_foreign_key_map_from_json
from process_sql import get_schema, Schema, get_sql

DB_DIR = os.path.join(BASE_DIR, 'data', 'syllable-level', 'databases')
RESULTS_FILE = os.path.join(BASE_DIR, 'benchmark_tensor_logs', 'benchmark_results.json')
OUT_FILE = os.path.join(BASE_DIR, 'benchmark_tensor_logs', 'benchmark_results_with_diff.json')

def main():
    print("Loading benchmark results...")
    with open(RESULTS_FILE, 'r', encoding='utf-8') as f:
        bench = json.load(f)

    print(f"Loaded {len(bench)} queries.")
    evaluator = Evaluator()
    
    for i, row in enumerate(bench):
        db_id = row['db_id']
        gold_sql_str = row['gold_sql']
        
        db_path = os.path.join(DB_DIR, f"{db_id}.sqlite")
        if not os.path.exists(db_path):
            db_path = os.path.join(DB_DIR, db_id, f"{db_id}.sqlite")
            
        try:
            schema_data = get_schema(db_path)
            schema = Schema(schema_data)
            
            # Apply common fixes
            if db_id == 'storm_record':
                gold_sql_str = gold_sql_str.replace('id_bao', 'id_con_bao')
            gold_sql_str = gold_sql_str.replace('ddanh_gia_xep_hang', 'danh_gia_xep_hang').replace('so_luong_ddanh_gia', 'so_luong_danh_gia')
            
            g_sql = get_sql(schema, gold_sql_str)
            hardness = evaluator.eval_hardness(g_sql)
            row['difficulty'] = hardness
        except Exception as e:
            row['difficulty'] = 'unknown'
            
        if (i+1) % 500 == 0:
            print(f"Processed {i+1}...")

    with open(OUT_FILE, 'w', encoding='utf-8') as f:
        json.dump(bench, f, ensure_ascii=False, indent=2)
    print("Saved difficulty tags successfully.")

if __name__ == '__main__':
    main()
