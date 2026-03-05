import json

test_json_path = '/root/Text2SQL-Report/ViText2SQL/data/syllable-level/test.json'
gold_sql_path = '/root/Text2SQL-Report/spiderEval/gold_base.sql'

print("Loading test.json...")
with open(test_json_path, 'r', encoding='utf-8') as f:
    data = json.load(f)

print("Loading gold_base.sql...")
with open(gold_sql_path, 'r', encoding='utf-8') as f:
    gold_lines = [line.strip() for line in f if line.strip()]

print("Syncing queries...")
gold_idx = 0
updated_count = 0

for item in data:
    if gold_idx >= len(gold_lines):
        break
        
    gold_line = gold_lines[gold_idx]
    
    parts = gold_line.split('\t')
    if len(parts) != 2:
        print(f"Warning: Unexpected format in gold_base.sql at line {gold_idx}: {gold_line}")
        gold_idx += 1
        continue
        
    gold_query, gold_db_id = parts[0], parts[1]
    
    # We sync any mismatched query that has the same db_id
    if item['db_id'] == gold_db_id:
        if item['query'] != gold_query:
            item['query'] = gold_query
            
            # Simple patch for some known typos or changes
            item['query_toks'] = gold_query.split()
            item['query_toks_no_value'] = gold_query.split() # Approximation just so the field isn't completely wrong
            updated_count += 1
                
    gold_idx += 1

print(f"Updated {updated_count} entries in test.json.")

if updated_count > 0:
    print("Saving test.json...")
    with open(test_json_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    print("Done!")
else:
    print("No updates needed.")
