import os
import json
import time
import requests
from concurrent.futures import ThreadPoolExecutor, as_completed

# Configuration
BASE_DIR = "/root/Text2SQL-Report"
SPIDER_EVAL_DIR = os.path.join(BASE_DIR, "spiderEval")
INPUT_JSON = os.path.join(SPIDER_EVAL_DIR, "no_self_check.json")
OUTPUT_JSON = os.path.join(SPIDER_EVAL_DIR, "full_pipeline_from_bridge.json")
TENSOR_API = "http://tensorsql-node:5002/api/text2sql/generate"

TABLES_FILE = os.path.join(BASE_DIR, "ViText2SQL/data/syllable-level/tables.json")
ENRICHED_CACHE_FILE = os.path.join(BASE_DIR, "benchmark_tensor_logs/enriched_schemas_cache.json")

def convert_to_tensor_schema(raw_schema):
    """Simplified version of the one in benchmark_tensor.py"""
    tables = []
    primary_keys = set(raw_schema.get('primary_keys', []))
    fk_cols = set(pair[0] for pair in raw_schema.get('foreign_keys', []))
    
    for tIdx, table_name in enumerate(raw_schema['table_names']):
        columns = []
        for cIdx, col in enumerate(raw_schema['column_names']):
            if col[0] == tIdx:
                columns.append({
                    "name": col[1],
                    "dataType": raw_schema['column_types'][cIdx],
                    "isPrimaryKey": cIdx in primary_keys,
                    "isForeignKey": cIdx in fk_cols,
                })
        tables.append({"name": table_name, "schema": "dbo", "columns": columns})
    
    relationships = []
    for src_idx, tgt_idx in raw_schema.get('foreign_keys', []):
        src_table_idx, src_col_name = raw_schema['column_names'][src_idx]
        tgt_table_idx, tgt_col_name = raw_schema['column_names'][tgt_idx]
        relationships.append({
            "fkTable": raw_schema['table_names'][src_table_idx],
            "fkColumn": src_col_name,
            "pkTable": raw_schema['table_names'][tgt_table_idx],
            "pkColumn": tgt_col_name,
        })
    return {"tables": tables, "relationships": relationships}

def process_one(entry, schemas_map, enriched_cache):
    db_id = entry['db_id']
    question = entry['question']
    initial_sql = entry['generated_sql']
    
    raw_schema = schemas_map.get(db_id)
    enriched = enriched_cache.get(db_id)
    
    payload = {
        "question": question,
        "dbId": db_id,
        "initialSql": initial_sql,
        "pipeline": "base" # We want the Full pipeline behavior
    }
    
    if enriched:
        payload["schema"] = enriched
    elif raw_schema:
        payload["schema"] = convert_to_tensor_schema(raw_schema)

    try:
        start_time = time.time()
        resp = requests.post(TENSOR_API, json=payload, timeout=300)
        resp.raise_for_status()
        data = resp.json()
        duration = int((time.time() - start_time) * 1000)
        
        return {
            **entry,
            "generated_sql": data.get('sql', initial_sql),
            "plan": data.get('plan'),
            "duration_ms": entry.get('duration_ms', 0) + duration,
            "bridged": True
        }
    except Exception as e:
        print(f"Error processing id {entry['id']}: {e}")
        return {**entry, "error": str(e), "bridged": False}

def main():
    print(f"Loading {INPUT_JSON}...")
    with open(INPUT_JSON, 'r') as f:
        data = json.load(f)
    
    print(f"Loading schemas...")
    with open(TABLES_FILE, 'r') as f:
        tables_data = json.load(f)
    schemas_map = {s['db_id']: s for s in tables_data}
    
    enriched_cache = {}
    if os.path.exists(ENRICHED_CACHE_FILE):
        with open(ENRICHED_CACHE_FILE, 'r') as f:
            enriched_cache = json.load(f)

    # For testing, we can limit the range
    # data = data[:10]
    
    results = []
    print(f"Processing {len(data)} entries with 4 workers...")
    with ThreadPoolExecutor(max_workers=4) as executor:
        futures = {executor.submit(process_one, entry, schemas_map, enriched_cache): entry for entry in data}
        for future in as_completed(futures):
            res = future.result()
            results.append(res)
            if len(results) % 50 == 0:
                print(f"Processed {len(results)}/{len(data)}...")

    results.sort(key=lambda x: x['id'])
    
    print(f"Saving to {OUTPUT_JSON}...")
    with open(OUTPUT_JSON, 'w', encoding='utf-8') as f:
        json.dump(results, f, ensure_ascii=False, indent=2)
    print("Done.")

if __name__ == "__main__":
    main()
