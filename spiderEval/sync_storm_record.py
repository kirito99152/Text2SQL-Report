import json
import os

test_json_path = '/root/Text2SQL-Report/ViText2SQL/data/syllable-level/test.json'
gold_sql_path = '/root/Text2SQL-Report/spiderEval/gold_base.sql'

print("Loading test.json...")
with open(test_json_path, 'r', encoding='utf-8') as f:
    data = json.load(f)

print("Loading gold_base.sql...")
with open(gold_sql_path, 'r', encoding='utf-8') as f:
    gold_lines = [line.strip() for line in f if line.strip()]

# Dựa vào thứ tự của test.json để map index. Chỉ ghi đè `query` của test.json bằng query từ gold_base.sql.
# Cấu trúc của gold_base.sql: "<query>\t<db_id>"

print("Syncing queries...")
gold_idx = 0
updated_count = 0

for item in data:
    if gold_idx >= len(gold_lines):
        break
        
    gold_line = gold_lines[gold_idx]
    
    # Split gold line by tab characters
    parts = gold_line.split('\t')
    if len(parts) != 2:
        print(f"Warning: Unexpected format in gold_base.sql at line {gold_idx}: {gold_line}")
        gold_idx += 1
        continue
        
    gold_query, gold_db_id = parts[0], parts[1]
    
    # Check if db_id matches and we are looking at a storm_record
    if item['db_id'] == gold_db_id:
        if gold_db_id == 'storm_record':
            if item['query'] != gold_query:
                item['query'] = gold_query
                
                # Cập nhật query_toks và query_toks_no_value một cách tương đối
                # Rất khó để cập nhật chính xác tokens, nhưng có thể gọi module tokenizer nếu có
                # Ở đây chúng ta tạm thời thay thế trực tiếp chuỗi 't1.id_con_bao = t3.id_con_bao' thành 't1.id_bao = t3.id_con_bao' 
                # trong mảng token nều có, nhưng cách an toàn nhất là để `extract_sql.py` lo phần query_toks hoặc
                # chỉ thay token 'id_con_bao' bằng 'id_bao' sau t1.
                
                # Patch lại mảng query_toks nếu chỉ khác mỗi id_con_bao
                for i in range(len(item['query_toks'])-2):
                    if item['query_toks'][i] == 't1.id_con_bao' and item['query_toks'][i+2] == 't3.id_con_bao':
                        item['query_toks'][i] = 't1.id_bao'
                        
                for i in range(len(item['query_toks_no_value'])-2):
                    if item['query_toks_no_value'][i] == 't1' and item['query_toks_no_value'][i+1] == '.' and item['query_toks_no_value'][i+2] == 'id_con_bao':
                        item['query_toks_no_value'][i+2] = 'id_bao'
                updated_count += 1
                
    gold_idx += 1

print(f"Updated {updated_count} storm_record entries in test.json.")

if updated_count > 0:
    print("Saving test.json...")
    with open(test_json_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    print("Done!")
else:
    print("No updates needed.")
