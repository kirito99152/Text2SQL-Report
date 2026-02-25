import json
import os
import re
import unicodedata

def remove_accents(input_str):
    if not input_str:
        return ""
    # Map đ to d explicitly as NFKD doesn't handle it
    input_str = input_str.replace('đ', 'd').replace('Đ', 'D')
    nfkd_form = unicodedata.normalize('NFKD', input_str)
    return "".join([c for c in nfkd_form if not unicodedata.combining(c)])

def normalize_name(name):
    name = remove_accents(name).lower()
    # Replace spaces and special chars with underscore
    name = re.sub(r'[^a-z0-9]', '_', name)
    # Remove consecutive underscores
    name = re.sub(r'_+', '_', name)
    # Strip underscores from ends
    name = name.strip('_')
    return name

DATA_DIR = "/root/repo/Text2SQL-Report/ViText2SQL/data/syllable-level"
TABLES_FILE = os.path.join(DATA_DIR, "tables.json")
YELP_INPUT = "/root/repo/Text2SQL-Report/yelp.database.json"

def main():
    with open(YELP_INPUT, 'r', encoding='utf-8') as f:
        yelp_data = json.load(f)[0]

    # 1. Identify and remove duplicate "id doanh nghiệp" in table 0
    # Business logic: if two consecutive columns have same table_idx and same name, remove the second one.
    
    col_names = yelp_data['column_names']
    col_names_orig = yelp_data['column_names_original']
    col_types = yelp_data['column_types']
    
    to_delete = []
    # In the specific file provided by user:
    # idx 1: [0, "id doanh nghiệp"]
    # idx 2: [0, "id doanh nghiệp"]
    if col_names[1] == col_names[2] == [0, "id doanh nghiệp"]:
        to_delete.append(2)
    
    # Also Check table 2 "người tiêu dùng":
    # col_names[16] == [2, "id người tiêu dùng"]
    # col_names[17] == [2, "id người tiêu dùng"]
    # Let's check indices in yelp.database.json
    # [15, "id người tiêu dùng"] (idx 15?) no wait.
    
    # Let's find all consecutive duplicates programmatically
    curr_to_delete = []
    for i in range(1, len(col_names)):
        if col_names[i] == col_names[i-1]:
            curr_to_delete.append(i)
            
    print(f"Deleting duplicate indices: {curr_to_delete}")
    
    # We must delete from end to start to keep indices valid during deletion
    for idx in sorted(curr_to_delete, reverse=True):
        del col_names[idx]
        del col_names_orig[idx]
        del col_types[idx]
        
        # Update Primary Keys
        new_pk = []
        for pk in yelp_data['primary_keys']:
            if pk == idx:
                continue # PK on deleted col? unlikely but safe
            elif pk > idx:
                new_pk.append(pk - 1)
            else:
                new_pk.append(pk)
        yelp_data['primary_keys'] = new_pk
        
        # Update Foreign Keys
        new_fk = []
        for fk in yelp_data['foreign_keys']:
            f, t = fk
            new_f = f - 1 if f > idx else f
            new_t = t - 1 if t > idx else t
            # if either was the deleted one, skip this FK (unlikely for duplicates)
            if f != idx and t != idx:
                new_fk.append([new_f, new_t])
        yelp_data['foreign_keys'] = new_fk

    # 2. Normalize names for column_names and table_names
    yelp_data['column_names'] = [[c[0], normalize_name(c[1])] if c[0] != -1 else c for c in col_names]
    yelp_data['table_names'] = [normalize_name(t) for t in yelp_data['table_names']]
    
    # Double check db_id
    yelp_data['db_id'] = "yelp"
    
    # 3. Append to tables.json
    with open(TABLES_FILE, 'r', encoding='utf-8') as f:
        all_tables = json.load(f)
        
    # Remove existing yelp if any (to allow re-run)
    all_tables = [t for t in all_tables if t['db_id'] != 'yelp']
    all_tables.append(yelp_data)
    
    with open(TABLES_FILE, 'w', encoding='utf-8') as f:
        json.dump(all_tables, f, ensure_ascii=False, indent=4)
        
    print("Merged yelp into tables.json successfully.")

if __name__ == "__main__":
    main()
