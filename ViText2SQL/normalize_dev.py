"""
Normalize dev.json queries: replace Vietnamese names (with diacritics + spaces)
with ASCII snake_case names (matching actual SQLite DB schema).

Uses the mapping from tables.json:
  column_names_original -> column_names
  table_names_original  -> table_names
"""

import json
import os
import re
import sqlite3

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data", "syllable-level")
DEV_PATH = os.path.join(BASE_DIR, "dev.json")
TABLES_PATH = os.path.join(BASE_DIR, "tables.json")
DB_DIR = os.path.join(BASE_DIR, "databases")
OUTPUT_PATH = os.path.join(BASE_DIR, "dev.json")  # overwrite in place


def load_json(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def save_json(path, data):
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)


def build_name_mapping(tables_data):
    """
    Build per-database mapping:
      original_name (Vietnamese with diacritics+spaces) -> normalized_name (ASCII snake_case)
    for both table names and column names.
    """
    db_mappings = {}
    for db in tables_data:
        db_id = db["db_id"]
        mapping = {}

        # Table name mapping
        table_names = db.get("table_names", [])
        table_names_orig = db.get("table_names_original", [])
        for orig, norm in zip(table_names_orig, table_names):
            if orig.lower() != norm.lower():
                mapping[orig.lower()] = norm.lower()

        # Column name mapping
        col_names = db.get("column_names", [])
        col_names_orig = db.get("column_names_original", [])
        for (tid_o, orig), (tid_n, norm) in zip(col_names_orig, col_names):
            if orig == "*":
                continue
            if orig.lower() != norm.lower():
                mapping[orig.lower()] = norm.lower()

        db_mappings[db_id] = mapping
    return db_mappings


def normalize_query(query, mapping):
    """
    Replace Vietnamese names in the query with their normalized equivalents.
    We sort by length descending to replace longer matches first (greedy).
    """
    if not mapping:
        return query

    normalized = query
    # Sort by length descending to match longer names first
    sorted_items = sorted(mapping.items(), key=lambda x: len(x[0]), reverse=True)

    for orig, norm in sorted_items:
        # Case-insensitive replacement, but preserve structure
        # We need to handle the fact that these names appear in SQL context
        # Use word-boundary-aware replacement
        pattern = re.compile(re.escape(orig), re.IGNORECASE)
        normalized = pattern.sub(norm, normalized)

    return normalized


def normalize_query_toks(query_toks, mapping):
    """
    Normalize each token in query_toks.
    Tokens can be:
      - Plain names: "kiến trúc sư" -> "kien_truc_su"
      - Aliased names: "t1.chiều dài theo mét" -> "t1.chieu_dai_theo_met"
    """
    if not mapping:
        return query_toks

    normalized = []
    for tok in query_toks:
        # Check if token has alias prefix like t1., t2., etc.
        alias_match = re.match(r'^(t\d+)\.(.*)', tok, re.IGNORECASE)
        if alias_match:
            alias = alias_match.group(1)
            name = alias_match.group(2)
            name_lower = name.lower()
            if name_lower in mapping:
                normalized.append(f"{alias}.{mapping[name_lower]}")
            else:
                normalized.append(tok)
        else:
            tok_lower = tok.lower()
            if tok_lower in mapping:
                normalized.append(mapping[tok_lower])
            else:
                normalized.append(tok)

    return normalized


def normalize_query_toks_no_value(query_toks_no_value, mapping):
    """
    Same as normalize_query_toks but for query_toks_no_value.
    In this format, aliases are split: ["t1", ".", "column name"]
    So we just normalize each token directly.
    """
    if not mapping:
        return query_toks_no_value

    normalized = []
    for tok in query_toks_no_value:
        tok_lower = tok.lower()
        if tok_lower in mapping:
            normalized.append(mapping[tok_lower])
        else:
            normalized.append(tok)

    return normalized


def try_execute_query(db_id, query):
    """Try to execute a query against the SQLite database."""
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
        return True, len(results)
    except Exception as e:
        try:
            conn.close()
        except:
            pass
        return False, str(e)


def main():
    print("Loading data...")
    dev_data = load_json(DEV_PATH)
    tables_data = load_json(TABLES_PATH)

    print("Building name mappings...")
    db_mappings = build_name_mapping(tables_data)

    # Show sample mapping
    sample_db = "architecture"
    if sample_db in db_mappings:
        print(f"\nSample mapping for '{sample_db}':")
        for orig, norm in sorted(db_mappings[sample_db].items()):
            print(f"  '{orig}' -> '{norm}'")

    print(f"\nNormalizing {len(dev_data)} queries...")
    for idx, item in enumerate(dev_data):
        db_id = item["db_id"]
        mapping = db_mappings.get(db_id, {})

        # Normalize query string
        item["query"] = normalize_query(item["query"], mapping)

        # Normalize query_toks
        item["query_toks"] = normalize_query_toks(item["query_toks"], mapping)

        # Normalize query_toks_no_value
        item["query_toks_no_value"] = normalize_query_toks_no_value(
            item["query_toks_no_value"], mapping
        )

    # Test execution after normalization
    print("\nTesting execution after normalization...")
    success = 0
    fail = 0
    errors = []
    for idx, item in enumerate(dev_data):
        ok, result = try_execute_query(item["db_id"], item["query"])
        if ok:
            success += 1
        else:
            fail += 1
            if len(errors) < 30:
                errors.append({"idx": idx, "db_id": item["db_id"], "query": item["query"], "error": result})

    print(f"\nExecution Results after normalization:")
    print(f"  Total: {len(dev_data)}")
    print(f"  Success: {success} ({100*success/len(dev_data):.1f}%)")
    print(f"  Errors: {fail} ({100*fail/len(dev_data):.1f}%)")

    if errors:
        print(f"\nFirst {len(errors)} errors:")
        for e in errors:
            print(f"  #{e['idx']} ({e['db_id']}): {e['error']}")
            print(f"    Query: {e['query'][:150]}")

    # Save
    print(f"\nSaving normalized dev.json to {OUTPUT_PATH}...")
    save_json(OUTPUT_PATH, dev_data)
    print("Done!")


if __name__ == "__main__":
    main()
