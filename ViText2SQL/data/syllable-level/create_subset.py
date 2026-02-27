import json
import random
import os
import sys

# Constants for DB threshold
DB_THRESHOLD = 10

# Paths
DATA_DIR = "/root/Text2SQL-Report/ViText2SQL/data/syllable-level/"
TABLES_FILE = os.path.join(DATA_DIR, "tables.json")
TEST_FILE = os.path.join(DATA_DIR, "test.json")
OUTPUT_FILE = os.path.join(DATA_DIR, "test_random_300.json")

# Difficulty Logic (simplified from evaluation.py)
WHERE_OPS = ('not', 'between', '=', '>', '<', '>=', '<=', '!=', 'in', 'like', 'is', 'exists')
AGG_OPS = ('none', 'max', 'min', 'count', 'sum', 'avg')
UNIT_OPS = ('none', '-', '+', "*", '/')

def count_agg(units):
    return len([unit for unit in units if unit[0] != 0])

def count_component1(sql):
    count = 0
    if len(sql['where']) > 0: count += 1
    if len(sql['groupBy']) > 0: count += 1
    if len(sql['orderBy']) > 0: count += 1
    if sql['limit'] is not None: count += 1
    if len(sql['from']['table_units']) > 0:
        count += len(sql['from']['table_units']) - 1
    
    ao = sql['from']['conds'][1::2] + sql['where'][1::2] + sql['having'][1::2]
    count += len([token for token in ao if token == 'or'])
    cond_units = sql['from']['conds'][::2] + sql['where'][::2] + sql['having'][::2]
    count += len([cond_unit for cond_unit in cond_units if cond_unit[1] == WHERE_OPS.index('like')])
    return count

def count_component2(sql):
    nested = []
    for cond_unit in sql['from']['conds'][::2] + sql['where'][::2] + sql['having'][::2]:
        if type(cond_unit[3]) is dict: nested.append(cond_unit[3])
        if type(cond_unit[4]) is dict: nested.append(cond_unit[4])
    if sql['intersect'] is not None: nested.append(sql['intersect'])
    if sql['except'] is not None: nested.append(sql['except'])
    if sql['union'] is not None: nested.append(sql['union'])
    return len(nested)

def count_others(sql):
    count = 0
    agg_count = count_agg(sql['select'][1])
    agg_count += count_agg(sql['where'][::2])
    agg_count += count_agg(sql['groupBy'])
    if len(sql['orderBy']) > 0:
        agg_count += count_agg([unit[1] for unit in sql['orderBy'][1] if unit[1]] +
                            [unit[2] for unit in sql['orderBy'][1] if unit[2]])
    agg_count += count_agg(sql['having'])
    if agg_count > 1: count += 1
    if len(sql['select'][1]) > 1: count += 1
    if len(sql['where']) > 1: count += 1
    if len(sql['groupBy']) > 1: count += 1
    return count

def get_hardness(sql):
    c1 = count_component1(sql)
    c2 = count_component2(sql)
    others = count_others(sql)
    if c1 <= 1 and others == 0 and c2 == 0: return "easy"
    elif (others <= 2 and c1 <= 1 and c2 == 0) or (c1 <= 2 and others < 2 and c2 == 0): return "medium"
    elif (others > 2 and c1 <= 2 and c2 == 0) or (2 < c1 <= 3 and others <= 2 and c2 == 0) or (c1 <= 1 and others == 0 and c2 <= 1): return "hard"
    else: return "extra"

def main():
    with open(TABLES_FILE) as f:
        tables = json.load(f)
    db_counts = {t["db_id"]: len(t["table_names"]) for t in tables}

    with open(TEST_FILE) as f:
        test_data = json.load(f)

    # Classify
    buckets = {
        "easy": [],
        "medium": [],
        "hard": [],
        "extra": []
    }

    for item in test_data:
        hardness = get_hardness(item["sql"])
        buckets[hardness].append(item)

    # Sample 300 total (75 per bucket)
    final_selection = []
    random.seed(42)
    
    for level in ["easy", "medium", "hard", "extra"]:
        level_samples = buckets[level]
        random.shuffle(level_samples)
        
        picked = level_samples[:75]
        final_selection.extend(picked)
        print(f"Level {level}: Picked {len(picked)} samples out of {len(level_samples)} available.")

    print(f"Total selected: {len(final_selection)}")
    
    # Shuffle final list so order is random
    random.shuffle(final_selection)
    
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(final_selection, f, ensure_ascii=False, indent=2)

if __name__ == "__main__":
    main()
