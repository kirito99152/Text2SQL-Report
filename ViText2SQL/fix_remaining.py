"""
Fix remaining normalization issues in dev.json after first-pass normalization.
Issues:
1. 'ngày ngay_ngay_dang_ky' -> 'ngay_ngay_dang_ky' (partial replacement leftover)
2. 'chi tiết khu_nha' -> 'chi_tiet_khu_nha' (partial replacement)
3. Column names starting with digits need quoting: 100_met -> "100_met"
4. ORDER BY before INTERSECT (SQL syntax - original data issue, leave as is)
"""
import json
import re
import sqlite3
import os
from collections import defaultdict

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data", "syllable-level")
DEV_PATH = os.path.join(BASE_DIR, "dev.json")
DB_DIR = os.path.join(BASE_DIR, "databases")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "fix_output.txt")


# Vietnamese diacritics removal map
VIET_MAP = str.maketrans({
    'à':'a','á':'a','ả':'a','ã':'a','ạ':'a',
    'ă':'a','ắ':'a','ằ':'a','ẳ':'a','ẵ':'a','ặ':'a',
    'â':'a','ấ':'a','ầ':'a','ẩ':'a','ẫ':'a','ậ':'a',
    'đ':'d',
    'è':'e','é':'e','ẻ':'e','ẽ':'e','ẹ':'e',
    'ê':'e','ế':'e','ề':'e','ể':'e','ễ':'e','ệ':'e',
    'ì':'i','í':'i','ỉ':'i','ĩ':'i','ị':'i',
    'ò':'o','ó':'o','ỏ':'o','õ':'o','ọ':'o',
    'ô':'o','ố':'o','ồ':'o','ổ':'o','ỗ':'o','ộ':'o',
    'ơ':'o','ớ':'o','ờ':'o','ở':'o','ỡ':'o','ợ':'o',
    'ù':'u','ú':'u','ủ':'u','ũ':'u','ụ':'u',
    'ư':'u','ứ':'u','ừ':'u','ử':'u','ữ':'u','ự':'u',
    'ỳ':'y','ý':'y','ỷ':'y','ỹ':'y','ỵ':'y',
    'À':'A','Á':'A','Ả':'A','Ã':'A','Ạ':'A',
    'Ă':'A','Ắ':'A','Ằ':'A','Ẳ':'A','Ẵ':'A','Ặ':'A',
    'Â':'A','Ấ':'A','Ầ':'A','Ẩ':'A','Ẫ':'A','Ậ':'A',
    'Đ':'D',
    'È':'E','É':'E','Ẻ':'E','Ẽ':'E','Ẹ':'E',
    'Ê':'E','Ế':'E','Ề':'E','Ể':'E','Ễ':'E','Ệ':'E',
    'Ì':'I','Í':'I','Ỉ':'I','Ĩ':'I','Ị':'I',
    'Ò':'O','Ó':'O','Ỏ':'O','Õ':'O','Ọ':'O',
    'Ô':'O','Ố':'O','Ồ':'O','Ổ':'O','Ỗ':'O','Ộ':'O',
    'Ơ':'O','Ớ':'O','Ờ':'O','Ở':'O','Ỡ':'O','Ợ':'O',
    'Ù':'U','Ú':'U','Ủ':'U','Ũ':'U','Ụ':'U',
    'Ư':'U','Ứ':'U','Ừ':'U','Ử':'U','Ữ':'U','Ự':'U',
    'Ỳ':'Y','Ý':'Y','Ỷ':'Y','Ỹ':'Y','Ỵ':'Y',
})


def remove_diacritics(text):
    """Remove Vietnamese diacritics and replace spaces with underscores."""
    return text.translate(VIET_MAP)


def normalize_remaining_vietnamese(text):
    """
    Find any remaining Vietnamese words (with diacritics) in the text
    and replace them with ASCII equivalents + join with underscores where appropriate.
    """
    # Pattern to find Vietnamese words with diacritics
    # We need to find sequences of Vietnamese words that should be joined
    # Strategy: find any word containing diacritical characters and replace

    def replace_viet_word(match):
        word = match.group(0)
        return remove_diacritics(word)

    # Replace individual Vietnamese words (containing diacritics)
    viet_chars = r'[àáảãạăắằẳẵặâấầẩẫậđèéẻẽẹêếềểễệìíỉĩịòóỏõọôốồổỗộơớờởỡợùúủũụưứừửữựỳýỷỹỵÀÁẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬĐÈÉẺẼẸÊẾỀỂỄỆÌÍỈĨỊÒÓỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÙÚỦŨỤƯỨỪỬỮỰỲÝỶỸỴ]'
    pattern = re.compile(r'\b\w*' + viet_chars + r'\w*\b')
    result = pattern.sub(replace_viet_word, text)

    return result


def fix_query(query):
    """Apply all remaining fixes to a query."""
    fixed = query

    # 1. Fix remaining Vietnamese diacritics
    fixed = normalize_remaining_vietnamese(fixed)

    # 2. Fix partial replacements where Vietnamese word is followed by underscore-word
    # e.g., "ngày ngay_ngay_dang_ky" should be "ngay_ngay_dang_ky"
    # After step 1, "ngày" becomes "ngay", so we get "ngay ngay_ngay_dang_ky"
    # We need to check if "word1 word2_..." should really be "word1_word2_..."
    # But we can't blindly join - "ngay" could be a standalone word in SQL context

    # 3. Quote column names that start with digits
    # e.g., 100_met should be "100_met" in SQL
    fixed = re.sub(r'\b(\d+_\w+)\b', r'"\1"', fixed)

    return fixed


def fix_query_toks(query_toks):
    """Apply remaining fixes to query tokens."""
    fixed = []
    for tok in query_toks:
        t = normalize_remaining_vietnamese(tok)
        # Quote digit-starting column names
        if re.match(r'^\d+_', t):
            t = f'"{t}"'
        # Handle aliased digit columns like t1.100_met
        alias_match = re.match(r'^(t\d+)\.(\d+_\w+)$', t)
        if alias_match:
            t = f'{alias_match.group(1)}."{alias_match.group(2)}"'
        fixed.append(t)
    return fixed


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

    p("=== Applying remaining fixes ===")

    for idx, item in enumerate(dev_data):
        old_query = item["query"]
        item["query"] = fix_query(item["query"])
        item["query_toks"] = fix_query_toks(item["query_toks"])
        item["query_toks_no_value"] = fix_query_toks(item["query_toks_no_value"])

        if old_query != item["query"]:
            p(f"\n  #{idx} ({item['db_id']})")
            p(f"  BEFORE: {old_query[:150]}")
            p(f"  AFTER:  {item['query'][:150]}")

    # Test again
    p("\n=== Execution test after fixes ===")
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
        error_types = defaultdict(list)
        for e in errors:
            err_msg = e["error"]
            if "no such table" in err_msg:
                key = f"no such table: {err_msg.split('no such table:')[1].strip()}"
            elif "no such column" in err_msg:
                key = f"no such column: {err_msg.split('no such column:')[1].strip()}"
            else:
                key = err_msg[:120]
            error_types[key].append(e)

        p(f"\n=== Error summary ({len(error_types)} unique types) ===")
        for err_type, err_list in sorted(error_types.items(), key=lambda x: -len(x[1])):
            p(f"\n[{len(err_list)}x] {err_type}")
            for e in err_list[:3]:
                p(f"  #{e['idx']} ({e['db_id']}): {e['query'][:150]}")

    # Save
    with open(DEV_PATH, "w", encoding="utf-8") as f:
        json.dump(dev_data, f, ensure_ascii=False, indent=4)
    p(f"\nSaved to {DEV_PATH}")

    out.close()
    print(f"Output: {OUT}")
    print(f"Success: {success}/{len(dev_data)} ({100*success/len(dev_data):.1f}%)")


if __name__ == "__main__":
    main()
