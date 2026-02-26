import json
import traceback
import sys
import os

sys.path.append(os.path.join(os.path.dirname(__file__), 'spiderEval'))
from evaluation import Evaluator, rebuild_sql_val, rebuild_sql_col, build_valid_col_units, build_foreign_key_map_from_json
from process_sql import get_schema, Schema, get_sql

DATA_DIR = "/root/repo/Text2SQL-Report/ViText2SQL/data/syllable-level"
TABLES_FILE = os.path.join(DATA_DIR, "tables.json")
TEST_FILE = os.path.join(DATA_DIR, "test.json")
DB_DIR = os.path.join(DATA_DIR, "databases")

kmaps = build_foreign_key_map_from_json(TABLES_FILE)

with open(TEST_FILE, 'r') as f:
    test_data = json.load(f)

errors = 0
for i, row in enumerate(test_data):
    db_id = row['db_id']
    gold_sql = row['query']
    
    db_path_flat = os.path.join(DB_DIR, f"{db_id}.sqlite")
    db_path_structured = os.path.join(DB_DIR, db_id, f"{db_id}.sqlite")
    db_path = db_path_flat if os.path.exists(db_path_flat) else db_path_structured

    try:
        if not os.path.exists(db_path):
            continue
        schema_data = get_schema(db_path)
        schema = Schema(schema_data)
        g_sql = get_sql(schema, gold_sql)
    except Exception as e:
        print(f"[{i}] Error parsing: {gold_sql} | DB: {db_id}")
        errors += 1

print(f"Total entries: {len(test_data)}")
print(f"Total parsing errors: {errors}")
