"""
Execution match test for the 151 entries where strict_match=True but exact_match_eval=False.
Runs both gold and generated SQL against the actual SQLite database and compares results.
"""
import os, sys, json, sqlite3

base_dir = os.path.dirname(__file__)
db_dir = os.path.join(base_dir, 'data', 'syllable-level', 'databases')

# Load comparison results and benchmark data
comp = json.load(open(os.path.join(base_dir, 'bootstrap', 'logs', 'exact_match_comparison.json'), encoding='utf-8'))
bench = json.load(open(os.path.join(base_dir, 'bootstrap', 'logs', 'benchmark_results.json'), encoding='utf-8'))

bench_by_id = {}
for e in bench:
    if 'error' not in e:
        bench_by_id[e['id']] = e

# Get the 151 discrepancies
discrepancies = [d for d in comp if not d['exact_match_eval'] and d['original_strict_match']]
print(f"Testing execution match on {len(discrepancies)} entries (strict=True, eval=False)\n")

exec_match = 0
exec_no_match = 0
exec_error = 0
details = []

for disc in discrepancies:
    entry = bench_by_id.get(disc['id'])
    if not entry:
        exec_error += 1
        continue
    
    db_id = entry['db_id']
    gold_sql = entry['gold_sql']
    gen_sql = entry['generated_sql']
    
    db_path_flat = os.path.join(db_dir, f"{db_id}.sqlite")
    db_path_structured = os.path.join(db_dir, db_id, f"{db_id}.sqlite")
    
    if os.path.exists(db_path_flat):
        db_path = db_path_flat
    elif os.path.exists(db_path_structured):
        db_path = db_path_structured
    else:
        exec_error += 1
        continue
    
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        
        # Execute gold
        cursor.execute(gold_sql)
        gold_results = set(cursor.fetchall())
        
        # Execute gen
        try:
            cursor.execute(gen_sql)
            gen_results = set(cursor.fetchall())
        except Exception as e:
            details.append({
                "id": disc['id'], "db_id": db_id,
                "status": "GEN_ERROR", "error": str(e),
                "gold_sql": gold_sql, "gen_sql": gen_sql
            })
            exec_error += 1
            conn.close()
            continue
        
        # Compare (set-based, ignoring order and column count differences)
        # For a fair comparison, compare as sets of tuples
        matched = (gold_results == gen_results)
        
        if matched:
            exec_match += 1
            status = "EXEC_MATCH"
        else:
            exec_no_match += 1
            status = "EXEC_NO_MATCH"
        
        details.append({
            "id": disc['id'], "db_id": db_id,
            "status": status,
            "gold_sql": gold_sql, "gen_sql": gen_sql,
            "gold_row_count": len(gold_results),
            "gen_row_count": len(gen_results)
        })
        
        conn.close()
        
    except Exception as e:
        details.append({
            "id": disc['id'], "db_id": db_id,
            "status": "ERROR", "error": str(e),
            "gold_sql": gold_sql, "gen_sql": gen_sql
        })
        exec_error += 1

print("====== Execution Match Summary ======")
print(f"Total tested:          {len(discrepancies)}")
print(f"Execution MATCH:       {exec_match}")
print(f"Execution NO MATCH:    {exec_no_match}")
print(f"Execution ERROR:       {exec_error}")
if (exec_match + exec_no_match) > 0:
    print(f"Match rate:            {exec_match / (exec_match + exec_no_match):.4f}")

print(f"\n--- Breakdown of NO MATCH / ERROR ---")
for d in details:
    if d['status'] != 'EXEC_MATCH':
        print(f"  id={d['id']} db={d['db_id']} status={d['status']}")
        if 'error' in d:
            print(f"    Error: {d['error']}")
        else:
            print(f"    Gold rows: {d.get('gold_row_count')}, Gen rows: {d.get('gen_row_count')}")
        print(f"    Gold: {d['gold_sql']}")
        print(f"    Gen:  {d['gen_sql']}")
        print()

# Save details
out_path = os.path.join(base_dir, 'bootstrap', 'logs', 'exec_match_discrepancies.json')
with open(out_path, 'w', encoding='utf-8') as f:
    json.dump(details, f, ensure_ascii=False, indent=2)
print(f"Details saved to {out_path}")
