"""Final targeted fixes for remaining normalization issues in dev.json"""
import json
import re
import sqlite3
import os
from collections import defaultdict

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data", "syllable-level")
DEV_PATH = os.path.join(BASE_DIR, "dev.json")
DB_DIR = os.path.join(BASE_DIR, "databases")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "final_fix_output.txt")


def fix_specific_issues(query, query_toks, query_toks_no_value, db_id):
    """Fix specific remaining issues based on analysis."""

    # Issue 1: "ngay ngay_ngay_dang_ky" should be "ngay_ngay_dang_ky"
    # These occur as "t1.ngay ngay_ngay_dang_ky" or "ngay ngay_ngay_dang_ky"
    # The pattern: a bare "ngay" before a column that starts with "ngay_"
    # In SQL, "t1.ngay ngay_ngay_dang_ky" means "t1.ngay AS ngay_ngay_dang_ky" which is wrong
    # It should be "t1.ngay_ngay_dang_ky"

    # Fix in query string
    query = re.sub(r'\bngay\s+ngay_ngay_dang_ky\b', 'ngay_ngay_dang_ky', query)
    query = re.sub(r'(t\d+)\.ngay\s+ngay_ngay_dang_ky', r'\1.ngay_ngay_dang_ky', query)

    # Issue 2: "chi tiet khu_nha" should be "chi_tiet_khu_nha"
    query = re.sub(r'\bchi tiet khu_nha\b', 'chi_tiet_khu_nha', query)

    # Fix in query_toks: merge "ngay" + "ngay_ngay_dang_ky" into one token
    fixed_toks = []
    i = 0
    while i < len(query_toks):
        tok = query_toks[i]
        # Check for "ngay" followed by "ngay_ngay_dang_ky"
        if i + 1 < len(query_toks):
            next_tok = query_toks[i + 1]
            if tok == "ngay" and next_tok == "ngay_ngay_dang_ky":
                fixed_toks.append("ngay_ngay_dang_ky")
                i += 2
                continue
            # Check for aliased version: "t1.ngay" followed by "ngay_ngay_dang_ky"
            alias_match = re.match(r'^(t\d+)\.ngay$', tok)
            if alias_match and next_tok == "ngay_ngay_dang_ky":
                fixed_toks.append(f"{alias_match.group(1)}.ngay_ngay_dang_ky")
                i += 2
                continue
            # "chi" "tiet" -> need to check if followed by "khu_nha"
            if tok == "chi" and next_tok == "tiet" and i + 2 < len(query_toks) and query_toks[i+2] == "khu_nha":
                fixed_toks.append("chi_tiet_khu_nha")
                i += 3
                continue
        fixed_toks.append(tok)
        i += 1

    # Same for query_toks_no_value
    fixed_toks_nv = []
    i = 0
    while i < len(query_toks_no_value):
        tok = query_toks_no_value[i]
        if i + 1 < len(query_toks_no_value):
            next_tok = query_toks_no_value[i + 1]
            if tok == "ngay" and next_tok == "ngay_ngay_dang_ky":
                fixed_toks_nv.append("ngay_ngay_dang_ky")
                i += 2
                continue
            alias_match = re.match(r'^(t\d+)$', tok)
            if alias_match and next_tok == "." and i + 2 < len(query_toks_no_value):
                col_tok = query_toks_no_value[i+2]
                if col_tok == "ngay" and i + 3 < len(query_toks_no_value) and query_toks_no_value[i+3] == "ngay_ngay_dang_ky":
                    fixed_toks_nv.append(tok)  # alias
                    fixed_toks_nv.append(".")
                    fixed_toks_nv.append("ngay_ngay_dang_ky")
                    i += 4
                    continue
            if tok == "chi" and next_tok == "tiet" and i + 2 < len(query_toks_no_value) and query_toks_no_value[i+2] == "khu_nha":
                fixed_toks_nv.append("chi_tiet_khu_nha")
                i += 3
                continue
        fixed_toks_nv.append(tok)
        i += 1

    return query, fixed_toks, fixed_toks_nv


def try_execute(db_id, query):
    db_path = os.path.join(DB_DIR, f"{db_id}.sqlite")
    try:
        conn = sqlite3.connect(db_path)
        c = conn.cursor()
        c.execute(query)
        c.fetchall()
        conn.close()
        return True, "OK"
    except Exception as e:
        try: conn.close()
        except: pass
        return False, str(e)


def main():
    with open(DEV_PATH, "r", encoding="utf-8") as f:
        dev_data = json.load(f)

    out = open(OUT, "w", encoding="utf-8")
    def p(s=""): out.write(s + "\n")

    changes = 0
    for idx, item in enumerate(dev_data):
        old_q = item["query"]
        q, qt, qtnv = fix_specific_issues(
            item["query"], item["query_toks"], item["query_toks_no_value"], item["db_id"]
        )
        item["query"] = q
        item["query_toks"] = qt
        item["query_toks_no_value"] = qtnv
        if old_q != q:
            changes += 1
            p(f"  #{idx}: {old_q[:100]} -> {q[:100]}")

    p(f"\nChanged {changes} queries")

    # Test
    success = 0
    fail = 0
    errors = []
    for idx, item in enumerate(dev_data):
        ok, msg = try_execute(item["db_id"], item["query"])
        if ok:
            success += 1
        else:
            fail += 1
            errors.append({"idx": idx, "db_id": item["db_id"], "query": item["query"], "error": msg})

    p(f"\nTotal: {len(dev_data)}")
    p(f"Success: {success} ({100*success/len(dev_data):.1f}%)")
    p(f"Errors: {fail} ({100*fail/len(dev_data):.1f}%)")

    if errors:
        p(f"\nRemaining errors:")
        for e in errors:
            p(f"  #{e['idx']} ({e['db_id']}): {e['error']}")
            p(f"    {e['query'][:180]}")

    with open(DEV_PATH, "w", encoding="utf-8") as f:
        json.dump(dev_data, f, ensure_ascii=False, indent=4)
    p(f"\nSaved to {DEV_PATH}")

    out.close()
    print(f"Output: {OUT}")
    print(f"Success: {success}/{len(dev_data)} ({100*success/len(dev_data):.1f}%)")


if __name__ == "__main__":
    main()
