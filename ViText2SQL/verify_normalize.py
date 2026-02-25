"""Quick verification of normalized dev.json queries"""
import json
import sqlite3
import os
from collections import defaultdict

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data", "syllable-level")
DEV_PATH = os.path.join(BASE_DIR, "dev.json")
DB_DIR = os.path.join(BASE_DIR, "databases")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "verify_output.txt")


def main():
    with open(DEV_PATH, "r", encoding="utf-8") as f:
        dev_data = json.load(f)

    out = open(OUT, "w", encoding="utf-8")
    def p(s=""):
        out.write(s + "\n")

    p(f"Total queries: {len(dev_data)}")

    # Show first 5 normalized queries
    p("\n=== First 5 normalized queries ===")
    for i in range(min(5, len(dev_data))):
        item = dev_data[i]
        p(f"\n  #{i} ({item['db_id']})")
        p(f"  query: {item['query']}")
        p(f"  query_toks: {item['query_toks']}")

    # Execute all queries
    p("\n=== Execution test ===")
    success = 0
    fail = 0
    errors = []

    for idx, item in enumerate(dev_data):
        db_id = item["db_id"]
        query = item["query"]
        db_path = os.path.join(DB_DIR, f"{db_id}.sqlite")

        try:
            conn = sqlite3.connect(db_path)
            cursor = conn.cursor()
            cursor.execute(query)
            cursor.fetchall()
            conn.close()
            success += 1
        except Exception as e:
            fail += 1
            try:
                conn.close()
            except:
                pass
            errors.append({"idx": idx, "db_id": db_id, "query": query, "error": str(e)})

    p(f"\nTotal: {len(dev_data)}")
    p(f"Success: {success} ({100*success/len(dev_data):.1f}%)")
    p(f"Errors: {fail} ({100*fail/len(dev_data):.1f}%)")

    if errors:
        # Group by error type
        error_types = defaultdict(list)
        for e in errors:
            err_msg = e["error"]
            if "no such table" in err_msg:
                key = f"no such table: {err_msg.split('no such table:')[1].strip()}"
            elif "no such column" in err_msg:
                key = f"no such column: {err_msg.split('no such column:')[1].strip()}"
            else:
                key = err_msg[:100]
            error_types[key].append(e)

        p(f"\n=== Error summary ({len(error_types)} unique types) ===")
        for err_type, err_list in sorted(error_types.items(), key=lambda x: -len(x[1])):
            p(f"\n[{len(err_list)}x] {err_type}")
            for e in err_list[:3]:
                p(f"  #{e['idx']} ({e['db_id']}): {e['query'][:150]}")
            if len(err_list) > 3:
                p(f"  ... and {len(err_list)-3} more")

    out.close()
    print(f"Verification written to {OUT}")
    print(f"Success: {success}/{len(dev_data)} ({100*success/len(dev_data):.1f}%)")


if __name__ == "__main__":
    main()
