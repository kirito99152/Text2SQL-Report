"""
Script to check schema normalization in dev.json queries against tables.json and actual SQLite databases.
"""

import json
import sqlite3
import os
from collections import defaultdict

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data", "syllable-level")
DEV_PATH = os.path.join(BASE_DIR, "dev.json")
TABLES_PATH = os.path.join(BASE_DIR, "tables.json")
DB_DIR = os.path.join(BASE_DIR, "databases")
OUTPUT_FILE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "check_output.txt")


def load_json(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def get_schema_map(tables_data):
    schema_map = {}
    for db in tables_data:
        db_id = db["db_id"]
        table_names_orig = db.get("table_names_original", [])
        col_names_orig = db.get("column_names_original", [])
        schema_map[db_id] = {
            "table_names_original": [t.lower() for t in table_names_orig],
            "column_names_original": [(c[0], c[1].lower()) for c in col_names_orig],
            "all_columns": set(c[1].lower() for c in col_names_orig if c[0] != -1),
            "all_tables": set(t.lower() for t in table_names_orig),
        }
    return schema_map


def check_db_schema(db_id):
    db_path = os.path.join(DB_DIR, f"{db_id}.sqlite")
    if not os.path.exists(db_path):
        return None, f"Database file not found: {db_path}"
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = [row[0] for row in cursor.fetchall()]
        db_schema = {"tables": {}, "all_columns": set(), "all_tables": set(t.lower() for t in tables)}
        for table in tables:
            cursor.execute(f'PRAGMA table_info("{table}")')
            cols = cursor.fetchall()
            col_names = [c[1] for c in cols]
            db_schema["tables"][table.lower()] = [c.lower() for c in col_names]
            for c in col_names:
                db_schema["all_columns"].add(c.lower())
        conn.close()
        return db_schema, None
    except Exception as e:
        return None, str(e)


def try_execute_query(db_id, query):
    db_path = os.path.join(DB_DIR, f"{db_id}.sqlite")
    if not os.path.exists(db_path):
        return False, f"Database not found: {db_id}"
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        clean_query = query.replace('\\"', '"')
        cursor.execute(clean_query)
        results = cursor.fetchall()
        conn.close()
        return True, f"OK ({len(results)} rows)"
    except Exception as e:
        try:
            conn.close()
        except:
            pass
        return False, str(e)


def main():
    out = open(OUTPUT_FILE, "w", encoding="utf-8")
    def p(s=""):
        out.write(s + "\n")
        out.flush()

    p("=" * 80)
    p("SCHEMA NORMALIZATION CHECK FOR dev.json")
    p("=" * 80)

    dev_data = load_json(DEV_PATH)
    tables_data = load_json(TABLES_PATH)
    schema_map = get_schema_map(tables_data)

    p(f"\nLoaded {len(dev_data)} queries from dev.json")
    p(f"Loaded {len(tables_data)} databases from tables.json")
    p(f"Found {len(os.listdir(DB_DIR))} SQLite files in databases/")

    # Part 1: Check DB existence
    p("\n" + "=" * 80)
    p("PART 1: Schema name matching (query_toks vs tables.json)")
    p("=" * 80)

    mismatches = []
    db_queries = defaultdict(list)

    for idx, item in enumerate(dev_data):
        db_id = item["db_id"]
        query = item["query"]
        db_queries[db_id].append((idx, query))
        if db_id not in schema_map:
            mismatches.append({"idx": idx, "db_id": db_id, "issue": f"Database '{db_id}' not found in tables.json"})

    p(f"\nUnique databases referenced in dev.json: {len(db_queries)}")
    if mismatches:
        p(f"\nWARNING: {len(mismatches)} queries reference unknown databases:")
        for m in mismatches[:10]:
            p(f"  Query #{m['idx']}: {m['issue']}")

    # Part 2: Actual DB schema vs tables.json
    p("\n" + "=" * 80)
    p("PART 2: Actual DB schema vs tables.json table_names_original")
    p("=" * 80)

    schema_diffs = []
    checked_dbs = set()

    for db_id in sorted(db_queries.keys()):
        if db_id in checked_dbs:
            continue
        checked_dbs.add(db_id)

        db_schema, err = check_db_schema(db_id)
        if err:
            schema_diffs.append(f"  ERROR {db_id}: {err}")
            continue

        if db_id in schema_map:
            json_tables = schema_map[db_id]["all_tables"]
            db_tables = db_schema["all_tables"]

            for t in json_tables - db_tables:
                schema_diffs.append(f"  MISMATCH {db_id}: Table '{t}' in tables.json but NOT in SQLite DB")
            for t in db_tables - json_tables:
                if t != 'sqlite_sequence':
                    schema_diffs.append(f"  EXTRA {db_id}: Table '{t}' in SQLite DB but NOT in tables.json")

    if schema_diffs:
        p(f"\nFound {len(schema_diffs)} schema differences:")
        for d in schema_diffs:
            p(d)
    else:
        p("\nAll database schemas match between tables.json and SQLite files")

    # Part 3: Execute ALL queries and report errors
    p("\n" + "=" * 80)
    p("PART 3: Query execution test")
    p("=" * 80)

    total = len(dev_data)
    success_count = 0
    error_count = 0
    errors = []

    for idx, item in enumerate(dev_data):
        db_id = item["db_id"]
        query = item["query"]
        ok, msg = try_execute_query(db_id, query)
        if ok:
            success_count += 1
        else:
            error_count += 1
            errors.append({"idx": idx, "db_id": db_id, "query": query, "error": msg, "question": item.get("question", "")})

    p(f"\nExecution Results:")
    p(f"  Total queries: {total}")
    p(f"  Success: {success_count} ({100*success_count/total:.1f}%)")
    p(f"  Errors: {error_count} ({100*error_count/total:.1f}%)")

    if errors:
        error_types = defaultdict(list)
        for e in errors:
            err_msg = e["error"]
            if "no such table" in err_msg:
                key = f"no such table: {err_msg.split('no such table:')[1].strip()}"
            elif "no such column" in err_msg:
                key = f"no such column: {err_msg.split('no such column:')[1].strip()}"
            elif "ambiguous column name" in err_msg:
                key = f"ambiguous column: {err_msg.split('ambiguous column name:')[1].strip()}"
            elif "near" in err_msg:
                key = err_msg[:100]
            else:
                key = err_msg[:100]
            error_types[key].append(e)

        p(f"\n--- Error summary by type ({len(error_types)} unique error types) ---")
        for err_type, err_list in sorted(error_types.items(), key=lambda x: -len(x[1])):
            p(f"\n  [{len(err_list)} occurrences] {err_type}")
            for e in err_list[:5]:
                p(f"    Query #{e['idx']} ({e['db_id']}): {e['query'][:120]}")
            if len(err_list) > 5:
                p(f"    ... and {len(err_list) - 5} more")

    # Part 4: Normalization analysis - compare query names vs DB actual names
    p("\n" + "=" * 80)
    p("PART 4: Normalization pattern analysis")
    p("=" * 80)

    for db_id in list(sorted(db_queries.keys()))[:5]:
        p(f"\n--- Database: {db_id} ---")

        db_schema, _ = check_db_schema(db_id)
        if db_schema:
            p(f"  SQLite tables: {list(db_schema['tables'].keys())}")
            for table, cols in db_schema['tables'].items():
                if table == 'sqlite_sequence':
                    continue
                p(f"    {table}: {cols}")

        if db_id in schema_map:
            p(f"  tables.json table_names_original: {schema_map[db_id]['table_names_original']}")

    # Part 5: Check if query uses original names (with spaces/diacritics) that 
    # match tables.json column_names_original but NOT SQLite actual column names
    p("\n" + "=" * 80)
    p("PART 5: Query uses Vietnamese names (original) vs SQLite column names")
    p("=" * 80)

    # Check a few databases to understand the pattern
    sample_dbs = list(sorted(db_queries.keys()))[:10]
    for db_id in sample_dbs:
        db_schema, _ = check_db_schema(db_id)
        if not db_schema or db_id not in schema_map:
            continue
        
        json_schema = schema_map[db_id]
        p(f"\n--- {db_id} ---")
        p(f"  Query uses (from query field): Vietnamese names with SPACES (e.g. column_names_original)")
        p(f"  SQLite DB has: {list(db_schema['tables'].keys())[:3]}")
        
        # Show first table comparison
        if db_schema['tables']:
            first_table = list(db_schema['tables'].keys())[0]
            if first_table != 'sqlite_sequence':
                sqlite_cols = db_schema['tables'][first_table]
                p(f"  SQLite cols of '{first_table}': {sqlite_cols[:5]}")
        
        if json_schema['column_names_original']:
            p(f"  tables.json original cols: {[c[1] for c in json_schema['column_names_original'][1:6]]}")

    p("\n" + "=" * 80)
    p("DONE")
    p("=" * 80)
    out.close()
    print(f"Output written to {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
