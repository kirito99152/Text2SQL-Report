import json
import os

TEST_JSON = '/root/Text2SQL-Report/ViText2SQL/data/syllable-level/test.json'

def fix_query(query, db_id):
    if db_id == 'storm_record':
        # Apply the logic: bao table uses id_con_bao
        # This is a bit complex for simple replace, so we use some patterns
        
        # t1.id_bao -> t1.id_con_bao (where t1 is usually bao)
        query = query.replace('t1.id_bao', 't1.id_con_bao')
        query = query.replace('t3.id_bao', 't3.id_con_bao')
        query = query.replace('from bao where id_bao', 'from bao where id_con_bao')
        query = query.replace('group by t1.id_bao', 'group by t1.id_con_bao')
        
        # Specific join logic
        query = query.replace('on t1.id_con_bao = t2.id_bao', 'on t1.id_con_bao = t2.id_bao') # correct
        query = query.replace('on t1.id_con_bao = t3.id_bao', 'on t1.id_con_bao = t3.id_con_bao') # joining two bao tables?
        
        # General bao.id_bao
        query = query.replace('bao.id_bao', 'bao.id_con_bao')
        
    # Global typos
    query = query.replace('ddanh_gia_xep_hang', 'danh_gia_xep_hang')
    query = query.replace('so_luong_ddanh_gia', 'so_luong_danh_gia')
    
    return query

def main():
    print(f"Loading {TEST_JSON}...")
    with open(TEST_JSON, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    changed = 0
    for entry in data:
        old_query = entry['query']
        db_id = entry['db_id']
        
        new_query = fix_query(old_query, db_id)
        
        entry['query'] = new_query
        # Update tokens - simple split by space for this dataset's style
        entry['query_toks'] = new_query.split()
        
        # Smart token replacement for query_toks_no_value
        new_no_val = []
        for i, t in enumerate(entry['query_toks_no_value']):
            if t == 'id_bao' and db_id == 'storm_record':
                # Look at preceding tokens for table alias context
                if i >= 2 and entry['query_toks_no_value'][i-2] in ['t1', 't3'] and entry['query_toks_no_value'][i-1] == '.':
                        new_no_val.append('id_con_bao')
                elif i >= 1 and entry['query_toks_no_value'][i-1] == 'bao': # handle "from bao where id_bao"
                        new_no_val.append('id_con_bao')
                else:
                    new_no_val.append(t)
            else:
                new_no_val.append(fix_query(t, db_id))
        
        if entry['query_toks_no_value'] != new_no_val or new_query != old_query:
            changed += 1
            
        entry['query_toks_no_value'] = new_no_val
            
    print(f"Updated {changed} entries in test.json.")
    
    with open(TEST_JSON, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    print("Done.")

if __name__ == '__main__':
    main()
