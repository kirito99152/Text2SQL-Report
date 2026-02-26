import json
import sqlite3
import os

DATA_DIR = "/root/repo/Text2SQL-Report/ViText2SQL/data/syllable-level"
TABLES_FILE = os.path.join(DATA_DIR, "tables.json")
DB_DIR = os.path.join(DATA_DIR, "databases")
DB_PATH = os.path.join(DB_DIR, "yelp.sqlite")

def main():
    if not os.path.exists(DB_DIR):
        print(f"Error: Databases directory not found: {DB_DIR}")
        return

    with open(TABLES_FILE, 'r', encoding='utf-8') as f:
        tables_data = json.load(f)
    
    yelp_schema = next((t for t in tables_data if t['db_id'] == 'yelp'), None)
    if not yelp_schema:
        print("Error: Yelp schema not found in tables.json")
        return

    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    table_names = yelp_schema['table_names']
    # column_names is list of [table_idx, col_name]
    # table_idx starts from 0. idx -1 is *
    
    # Group columns by table
    tables = {i: [] for i in range(len(table_names))}
    for tab_idx, col_name in yelp_schema['column_names']:
        if tab_idx != -1:
            tables[tab_idx].append(col_name)

    for tab_idx, cols in tables.items():
        table_name = table_names[tab_idx]
        
        # Simple schema: all columns as TEXT or REAL based on column_types if available
        # But for dummy, TEXT is enough to satisfy structural checks.
        col_defs = []
        for col in cols:
            col_defs.append(f"`{col}` TEXT")
        
        create_stmt = f"CREATE TABLE `{table_name}` ({', '.join(col_defs)});"
        print(f"Executing: {create_stmt}")
        cursor.execute(f"DROP TABLE IF EXISTS `{table_name}`")
        cursor.execute(create_stmt)

    conn.commit()
    conn.close()
    print(f"Successfully created dummy database at {DB_PATH}")

if __name__ == "__main__":
    main()
