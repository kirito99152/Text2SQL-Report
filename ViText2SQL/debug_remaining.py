"""Debug remaining errors and fix them"""
import json
import sqlite3
import os

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data", "syllable-level")
DB_DIR = os.path.join(BASE_DIR, "databases")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "debug_remaining.txt")

def main():
    out = open(OUT, "w", encoding="utf-8")
    def p(s=""):
        out.write(s + "\n")

    # Check e_learning schema
    for db_name in ["e_learning", "swimming", "customers_campaigns_ecommerce"]:
        p(f"\n=== {db_name} ===")
        conn = sqlite3.connect(os.path.join(DB_DIR, f"{db_name}.sqlite"))
        c = conn.cursor()
        c.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = [r[0] for r in c.fetchall() if r[0] != 'sqlite_sequence']
        for t in tables:
            c.execute(f'PRAGMA table_info("{t}")')
            cols = [r[1] for r in c.fetchall()]
            p(f"  {t}: {cols}")
        conn.close()

    # Check tables.json mappings for these DBs
    with open(os.path.join(BASE_DIR, "tables.json"), "r", encoding="utf-8") as f:
        tables_data = json.load(f)

    for db in tables_data:
        if db["db_id"] in ["e_learning", "swimming", "customers_campaigns_ecommerce"]:
            p(f"\n=== tables.json {db['db_id']} ===")
            cols_orig = db.get("column_names_original", [])
            cols_norm = db.get("column_names", [])
            for (to, co), (tn, cn) in zip(cols_orig, cols_norm):
                if co != cn and co != "*":
                    p(f"  [{to}] '{co}' -> '{cn}'")

    # Show the problematic queries from current dev.json
    with open(os.path.join(BASE_DIR, "dev.json"), "r", encoding="utf-8") as f:
        dev_data = json.load(f)

    problem_indices = [168, 275, 276, 315, 316, 355, 356, 365, 366, 369, 370, 371, 372, 796, 799]
    p("\n=== Problematic queries (current state) ===")
    for idx in problem_indices:
        if idx < len(dev_data):
            item = dev_data[idx]
            p(f"\n  #{idx} ({item['db_id']})")
            p(f"  query: {item['query']}")

    out.close()
    print(f"Written to {OUT}")

if __name__ == "__main__":
    main()
