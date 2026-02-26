import json, sys, re
from collections import Counter
sys.stdout.reconfigure(encoding='utf-8')

data = json.load(open('benchmark_tensor_logs/benchmark_results.json', encoding='utf-8'))

total = len(data)
errors = [r for r in data if r.get('error')]
success = [r for r in data if not r.get('error')]
matches = [r for r in success if r.get('exact_match') == True]
failures = [r for r in success if r.get('exact_match') == False]

print(f"Total: {total}, API errors: {len(errors)}, Success: {len(success)}")
print(f"Exact Match: {len(matches)}/{len(success)} ({len(matches)/max(len(success),1)*100:.1f}%)")
print(f"Failures: {len(failures)}")
print()

# Categorize failures by error type
categories = {
    'inner_join': [],
    'left_join': [],
    'alias_as': [],
    'alias_same_name': [],
    'concat_pipe': [],
    'cast_func': [],
    'parse_other': [],
    'extra_cols': [],
    'missing_distinct': [],
    'added_distinct': [],
    'not_in_vs_except': [],
    'intersect_missed': [],
    'union_missed': [],
    'wrong_group_by': [],
    'wrong_where_op': [],
    'wrong_table_join': [],
    'vn_translation': [],
    'structural_other': [],
}

for r in failures:
    err = r.get('eval_error', '') or ''
    gen = r.get('generated_sql', '') or ''
    gold = r.get('gold_sql', '') or ''
    gen_u = gen.upper()
    gold_u = gold.upper()
    
    assigned = False
    
    # Parse errors first
    if 'inner' in err.lower():
        categories['inner_join'].append(r)
        assigned = True
    elif 'left' in err.lower():
        categories['left_join'].append(r)
        assigned = True
    elif err.strip().lower() in ['as', "error col: as"]:
        categories['alias_as'].append(r)
        assigned = True
    elif 'alias' in err.lower() and 'same name' in err.lower():
        categories['alias_same_name'].append(r)
        assigned = True
    elif '||' in err or 'concat' in err.lower():
        categories['concat_pipe'].append(r)
        assigned = True
    elif 'cast' in err.lower():
        categories['cast_func'].append(r)
        assigned = True
    elif 'not' in err.lower() or "t1" in err.lower() or "t2" in err.lower():
        categories['parse_other'].append(r)
        assigned = True
    elif err and err not in ['', 'null', None]:
        categories['parse_other'].append(r)
        assigned = True
    
    if assigned:
        continue
    
    # Structural analysis
    # Extra columns
    gen_sel = gen_u.split('FROM')[0] if 'FROM' in gen_u else ''
    gold_sel = gold_u.split('FROM')[0] if 'FROM' in gold_u else ''
    gen_commas = gen_sel.count(',')
    gold_commas = gold_sel.count(',')
    
    if gen_commas > gold_commas:
        categories['extra_cols'].append(r)
        continue
    
    # DISTINCT issues
    if 'DISTINCT' in gold_u and 'DISTINCT' not in gen_u:
        categories['missing_distinct'].append(r)
        continue
    if 'DISTINCT' not in gold_u and 'DISTINCT' in gen_u:
        categories['added_distinct'].append(r)
        continue
    
    # NOT IN vs EXCEPT
    if ('NOT IN' in gen_u and 'EXCEPT' in gold_u) or ('EXCEPT' in gen_u and 'NOT IN' in gold_u):
        categories['not_in_vs_except'].append(r)
        continue
    
    # INTERSECT missed
    if 'INTERSECT' in gold_u and 'INTERSECT' not in gen_u:
        categories['intersect_missed'].append(r)
        continue
    
    # UNION missed
    if 'UNION' in gold_u and 'UNION' not in gen_u:
        categories['union_missed'].append(r)
        continue
    
    # GROUP BY mismatch
    gold_gb = re.findall(r'GROUP BY\s+(\S+)', gold_u)
    gen_gb = re.findall(r'GROUP BY\s+(\S+)', gen_u)
    if gold_gb and gen_gb and gold_gb != gen_gb:
        categories['wrong_group_by'].append(r)
        continue
    
    # WHERE operator mismatch (>= vs >, etc)
    if ('>=' in gold and '>' in gen and '>=' not in gen) or \
       ('>' in gold and '>=' in gen and '>' in gold and '>=' not in gold):
        categories['wrong_where_op'].append(r)
        continue
    
    # Vietnamese translation of values
    vn_words = ["'Mỹ'", "'Pháp'", "'Giáo sư'", "'Khoa học máy tính'", "'nữ'", "'nam'", 
                "'Ghi nợ'", "'Đặt hàng'", "'Không phản hồi'", "'Bị huỷ'", "'Đã thanh toán'",
                "'Giới thiệu về'", "'cơ sở dữ liệu'", "'Lời cảm ơn'", "'Đạt'", "'Trượt'",
                "'tiếng Tây Ban Nha'", "'hệ điều hành'", "'cấu trúc dữ liệu'"]
    eng_in_gold = any(w in gold for w in ['"American"', '"French"', '"Professor"', '"Female"', '"Male"',
                                           '"Debit"', '"Order"', '"No Response"', '"Cancelled"', '"Paid"',
                                           '"France"', '"Computer Science"'])
    if eng_in_gold and any(w in gen for w in vn_words):
        categories['vn_translation'].append(r)
        continue
    
    # Wrong table/join logic
    gold_tables = set(re.findall(r'FROM\s+(\w+)', gold_u) + re.findall(r'JOIN\s+(\w+)', gold_u))
    gen_tables = set(re.findall(r'FROM\s+(\w+)', gen_u) + re.findall(r'JOIN\s+(\w+)', gen_u))
    if gold_tables != gen_tables:
        categories['wrong_table_join'].append(r)
        continue
    
    categories['structural_other'].append(r)

# Output report
report = {}
for cat, items in categories.items():
    if items:
        report[cat] = {
            'count': len(items),
            'ids': [r['id'] for r in items],
            'samples': [
                {
                    'id': r['id'],
                    'q': r.get('question', '')[:100],
                    'gold': r.get('gold_sql', '')[:150],
                    'gen': r.get('generated_sql', '')[:150],
                    'err': r.get('eval_error', '')
                }
                for r in items[:5]  # max 5 samples per category
            ]
        }

summary = {
    'total': total,
    'api_errors': len(errors),
    'success': len(success),
    'exact_match': len(matches),
    'exact_match_pct': round(len(matches)/max(len(success),1)*100, 1),
    'failures': len(failures),
    'categories': report
}

with open('benchmark_tensor_logs/analysis_v2.json', 'w', encoding='utf-8') as f:
    json.dump(summary, f, ensure_ascii=False, indent=2)

# Print summary
print("=== FAILURE CATEGORIES ===")
for cat, items in sorted(categories.items(), key=lambda x: -len(x[1])):
    if items:
        print(f"  {cat}: {len(items)} ({', '.join(str(r['id']) for r in items[:8])}{'...' if len(items)>8 else ''})")

# Duration stats
durations = [r['duration_ms'] for r in success if r.get('duration_ms')]
if durations:
    print(f"\n=== DURATION ===")
    print(f"  Avg: {sum(durations)/len(durations)/1000:.1f}s")
    print(f"  Total: {sum(durations)/1000/60:.1f}m")

print("\nSaved to benchmark_tensor_logs/analysis_v2.json")
