import json
import os

def extract_sql_from_json(json_path, gold_sql_path, pred_sql_path):
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    with open(gold_sql_path, 'w', encoding='utf-8') as f_gold, \
         open(pred_sql_path, 'w', encoding='utf-8') as f_pred:
        for entry in data:
            gold_sql = entry.get('gold_sql', '').replace('\n', ' ').strip()
            pred_sql = entry.get('generated_sql', '').replace('\n', ' ').strip()
            db_id = entry.get('db_id', '')
            
            if gold_sql and db_id:
                f_gold.write(f"{gold_sql}\t{db_id}\n")
            if pred_sql:
                f_pred.write(f"{pred_sql}\n")

if __name__ == "__main__":
    files = [
        "no_planning.json",
        "no_self_check.json",
        "remove_schema_linking.json"
    ]
    
    base_dir = "/root/Text2SQL-Report/spiderEval"
    
    for filename in files:
        json_path = os.path.join(base_dir, filename)
        prefix = filename.replace(".json", "")
        # We only need the pred file since the user said gold_base is the standard
        pred_path = os.path.join(base_dir, f"pred_{prefix}.sql")
        
        print(f"Extracting {filename}...")
        with open(json_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        with open(pred_path, 'w', encoding='utf-8') as f_pred:
            for entry in data:
                pred_sql = entry.get('generated_sql', '').replace('\n', ' ').strip()
                if not pred_sql:
                    pred_sql = "SELECT 1"
                f_pred.write(f"{pred_sql}\n")
