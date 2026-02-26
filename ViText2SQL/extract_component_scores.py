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

def main():
    print("Loading data...")
    if not os.path.exists(RESULTS_FILE):
        print(f"Error: {RESULTS_FILE} not found.")
        return

    with open(RESULTS_FILE, 'r', encoding='utf-8') as f:
        bench = json.load(f)
    
    kmaps = build_foreign_key_map_from_json(TABLES_FILE)
    evaluator = Evaluator()
    
    total = len(bench)
    # Stats for Exact Match by difficulty
    diff_em = {
        'easy': {'count': 0, 'em': 0},
        'medium': {'count': 0, 'em': 0},
        'hard': {'count': 0, 'em': 0},
        'extra': {'count': 0, 'em': 0}
    }
    
    # Stats for Components (averaged across ALL queries)
    comp_stats = {
        'count': 0,
        'select': 0,
        'where': 0,
        'order': 0,
        'group': 0,
        'keywords': 0
    }

    print(f"Analyzing {total} results using Spider Evaluation logic...")
    
    for i, row in enumerate(bench):
        db_id = row.get('db_id')
        gold_sql_str = row.get('gold_sql', '')
        gen_sql_str = row.get('generated_sql', 'SELECT 1')
        
        db_path = os.path.join(DB_DIR, f"{db_id}.sqlite")
        if not os.path.exists(db_path):
            db_path = os.path.join(DB_DIR, db_id, f"{db_id}.sqlite")
        
        if not os.path.exists(db_path):
            continue

        try:
            schema_data = get_schema(db_path)
            schema = Schema(schema_data)
            
            # Apply common fixes for fair comparison
            if db_id == 'storm_record':
                gold_sql_str = gold_sql_str.replace('id_bao', 'id_con_bao')
            gold_sql_str = gold_sql_str.replace('ddanh_gia_xep_hang', 'danh_gia_xep_hang').replace('so_luong_ddanh_gia', 'so_luong_danh_gia')
            gen_sql_str = gen_sql_str.replace('ddanh_gia_xep_hang', 'danh_gia_xep_hang').replace('so_luong_ddanh_gia', 'so_luong_danh_gia')

            g_sql = get_sql(schema, gold_sql_str)
            p_sql = get_sql(schema, gen_sql_str)
            
            hardness = evaluator.eval_hardness(g_sql)
            
            kmap = kmaps.get(db_id, {})
            g_valid = build_valid_col_units(g_sql['from']['table_units'], schema)
            g_sql = rebuild_sql_val(g_sql)
            g_sql = rebuild_sql_col(g_valid, g_sql, kmap)
            
            p_valid = build_valid_col_units(p_sql['from']['table_units'], schema)
            p_sql = rebuild_sql_val(p_sql)
            p_sql = rebuild_sql_col(p_valid, p_sql, kmap)
            
            # 1. Exact Match Check
            is_em = evaluator.eval_exact_match(p_sql, g_sql)
            if hardness in diff_em:
                diff_em[hardness]['count'] += 1
                if is_em:
                    diff_em[hardness]['em'] += 1
            
            # 2. Component Scores
            partial = evaluator.eval_partial_match(p_sql, g_sql)
            comp_stats['count'] += 1
            comp_stats['select'] += partial['select']['f1']
            comp_stats['where'] += partial['where']['f1']
            comp_stats['order'] += partial['order']['f1']
            comp_stats['group'] += partial['group']['f1']
            comp_stats['keywords'] += partial['keywords']['f1']
                
        except Exception:
            # If parsing fails, it's a 0 for EM and components
            if 'hardness' in locals() and hardness in diff_em:
                diff_em[hardness]['count'] += 1
            comp_stats['count'] += 1
            
        if (i+1) % 500 == 0:
            print(f"  Processed {i+1}...")

    print("\n" + "="*80)
    print(f"{'Approach':<20} | {'Easy':<5} | {'Med':<5} | {'Hard':<5} | {'ExH':<5} | {'SEL':<5} | {'WHE':<5} | {'ORD':<5} | {'GRP':<5} | {'KEY':<5}")
    print("-" * 80)
    
    # EM per Difficulty
    row = f"{'TensorSQL (Qwen3)':<20} | "
    levels = ['easy', 'medium', 'hard', 'extra']
    for l in levels:
        acc = (diff_em[l]['em'] / max(diff_em[l]['count'], 1)) * 100
        row += f"{acc:4.1f} | "
    
    # Global Component F1s
    comps = ['select', 'where', 'order', 'group', 'keywords']
    for c in comps:
        score = (comp_stats[c] / max(comp_stats['count'], 1)) * 100
        row += f"{score:4.1f} | "
    
    print(row)
    print("="*80)
    print(f"Overall Exact Match (Total): {(sum(d['em'] for d in diff_em.values()) / max(sum(d['count'] for d in diff_em.values()), 1) * 100):.2f}%")

if __name__ == '__main__':
    main()
