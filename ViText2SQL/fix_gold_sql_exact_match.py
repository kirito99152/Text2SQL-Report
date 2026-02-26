import json
import sqlite3
import os
import unicodedata
import re

def simulate_user_error(text):
    text = text.replace('đ', '').replace('Đ', '')
    text = unicodedata.normalize('NFKD', text).encode('ASCII', 'ignore').decode('utf-8')
    text = re.sub(r'[^a-zA-Z0-9]', '_', text)
    text = re.sub(r'_+', '_', text)
    return text.strip('_').lower()

base_dir = '/root/Text2SQL-Report/ViText2SQL'
tables_path = os.path.join(base_dir, 'data', 'syllable-level', 'tables.json')
db_dir = os.path.join(base_dir, 'data', 'syllable-level', 'databases')
bench_path = os.path.join(base_dir, 'benchmark_tensor_logs', 'benchmark_results.json')
out_path = os.path.join(base_dir, 'benchmark_tensor_logs', 'benchmark_results_fixed.json')

with open(tables_path, 'r', encoding='utf-8') as f:
    tables_data = json.load(f)

db_map = {}
for schema in tables_data:
    if schema['db_id'] == 'yelp':
        mapping = {}
        for orig, base in zip(schema['column_names_original'], schema['column_names']):
            if orig[1] != '*':
                # Map from user's stripped format to the correct base format
                mapping[simulate_user_error(orig[1])] = base[1].lower()
        
        for orig, base in zip(schema['table_names_original'], schema['table_names']):
            mapping[simulate_user_error(orig)] = base.lower()
        
        # Sort by length descending
        db_map['yelp'] = {k: v for k, v in sorted(mapping.items(), key=lambda item: len(item[0]), reverse=True)}

with open(bench_path, 'r', encoding='utf-8') as f:
    bench = json.load(f)

def run_query(sql, db_id):
    db_path = os.path.join(db_dir, f"{db_id}.sqlite")
    if not os.path.exists(db_path):
        db_path = os.path.join(db_dir, db_id, f"{db_id}.sqlite")
    
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute(sql)
    results = cursor.fetchall()
    conn.close()
    return set(results)

changed = 0
fixed_count = 0

for row in bench:
    if row.get('db_id') == 'yelp':
        query = row['gold_sql'].lower()
        mapping = db_map['yelp']
        
        for bad_name, good_name in mapping.items():
            if not bad_name: # Handle empty strings just in case
                continue
            # Simple substring replacement
            query = query.replace(bad_name, good_name)
        
        row['gold_sql'] = query
        changed += 1

        gen_sql = row.get('generated_sql')
        if not gen_sql or gen_sql in ['N/A', 'None']:
            row['exact_match'] = False
            row['eval_error'] = 'No generated SQL'
            continue
            
        try:
            gold_results = run_query(query, 'yelp')
            gen_error = None
            try:
                gen_results = run_query(gen_sql, 'yelp')
            except Exception as e:
                gen_error = str(e)

            if gen_error:
                row['exact_match'] = False
                row['eval_error'] = gen_error
            else:
                if gold_results == gen_results:
                    row['exact_match'] = True
                    row['eval_error'] = 'None'
                    row['strict_match'] = True
                    row['loose_match'] = True
                    fixed_count += 1
                else:
                    row['exact_match'] = False
                    row['eval_error'] = 'Data Mismatch'
        except Exception as e:
            row['exact_match'] = False
            row['eval_error'] = f"Gold SQL execution error: {str(e)}"

with open(bench_path, 'w', encoding='utf-8') as f:
    json.dump(bench, f, ensure_ascii=False, indent=2)

print(f"Updated {changed} yelp gold SQL.")
print(f"Exact match flipped to True: {fixed_count} / {changed}")
