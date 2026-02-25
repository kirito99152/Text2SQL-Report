import json
import os
import re

DATA_DIR = "/root/repo/Text2SQL-Report/ViText2SQL/data/syllable-level"
TABLES_FILE = os.path.join(DATA_DIR, "tables.json")
TEST_FILE = os.path.join(DATA_DIR, "test.json")
OUTPUT_FILE = os.path.join(DATA_DIR, "test.json") # overwrite

def main():
    print("Loading tables.json...")
    with open(TABLES_FILE, 'r', encoding='utf-8') as f:
        tables_data = json.load(f)

    db_map = {}
    for schema in tables_data:
        db_id = schema['db_id']
        mapping = {}
        
        # columns
        for orig, base in zip(schema['column_names_original'], schema['column_names']):
            if orig[1] != '*':
                # sometimes columns have tables prepended if ambiguous, but spider queries often just use the names
                mapping[orig[1].lower()] = base[1].lower()

        # tables
        for orig, base in zip(schema['table_names_original'], schema['table_names']):
            mapping[orig.lower()] = base.lower()
            
        # Sort by length descending to replace longest phrases first
        sorted_mapping = {k: v for k, v in sorted(mapping.items(), key=lambda item: len(item[0]), reverse=True)}
        db_map[db_id] = sorted_mapping

    print("Loading test.json...")
    with open(TEST_FILE, 'r', encoding='utf-8') as f:
        test_data = json.load(f)

    print("Processing queries...")
    changed_count = 0
    
    for row in test_data:
        db_id = row['db_id']
        if db_id not in db_map:
            continue
            
        mapping = db_map[db_id]
        query = row['query'].lower()
        original_query = row['query']
        
        # We need to replace whole words/phrases. Since the original queries might have spaces in table/col names,
        # regex replacement with boundary might be tricky because Vietnamese characters block \b in some cases.
        # But since we sorted by length descending, simple string replace is usually safe enough.
        
        for orig_name, base_name in mapping.items():
            query = query.replace(orig_name, base_name)
            
        row['query'] = query
        changed_count += 1
            
        # Update toks basic
        for i, tok in enumerate(row['query_toks']):
            tok_lower = tok.lower()
            for orig_name, base_name in mapping.items():
                tok_lower = tok_lower.replace(orig_name, base_name)
            row['query_toks'][i] = tok_lower
            
        for i, tok in enumerate(row.get('query_toks_no_value', [])):
            tok_lower = tok.lower()
            for orig_name, base_name in mapping.items():
                tok_lower = tok_lower.replace(orig_name, base_name)
            row['query_toks_no_value'][i] = tok_lower

    print(f"Applying changes to {changed_count} rows out of {len(test_data)}")
    
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        json.dump(test_data, f, ensure_ascii=False, indent=4)
        
    print("Done!")

if __name__ == "__main__":
    main()
