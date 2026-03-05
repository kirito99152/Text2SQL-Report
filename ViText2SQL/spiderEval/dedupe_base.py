import json
import os

TEST_JSON = "/root/Text2SQL-Report/ViText2SQL/data/syllable-level/test.json"
RESULTS5 = "/root/Text2SQL-Report/ViText2SQL/benchmark_tensor_logs/benchmark_results5.json"
OUTPUT = "/root/Text2SQL-Report/ViText2SQL/benchmark_tensor_logs/benchmark_results_base.json"

def main():
    print(f"Loading test queries from {TEST_JSON}...")
    with open(TEST_JSON, 'r', encoding='utf-8') as f:
        test_data = json.load(f)
    
    print(f"Loading results from {RESULTS5}...")
    with open(RESULTS5, 'r', encoding='utf-8') as f:
        results5_data = json.load(f)
    
    # Create lookup for results5: (question, gold) -> best result
    results_lookup = {}
    for r in results5_data:
        q = r.get('question', '').strip()
        g = r.get('gold_sql', '').strip()
        key = (q, g)
        if key not in results_lookup or (r.get('exact_match') is True and not results_lookup[key].get('exact_match')):
            results_lookup[key] = r

    seen_keys = set()
    deduped_data = []
    missing_count = 0
    
    for i, test_entry in enumerate(test_data):
        q = test_entry.get('question', '').strip()
        g = test_entry.get('query', '').strip()
        key = (q, g)
        
        # Deduplication check: only keep the first occurrence of this Q/G pair
        if key in seen_keys:
            continue
        seen_keys.add(key)
        
        best = results_lookup.get(key)
        
        if best:
            entry = {
                'id': i, # Use the original first-occurrence ID
                'db_id': test_entry['db_id'],
                'question': q,
                'gold_sql': g,
                'generated_sql': best.get('generated_sql', ''),
                'exact_match': best.get('exact_match', False),
                'eval_error': best.get('eval_error'),
                'duration_ms': best.get('duration_ms', 0)
            }
        else:
            missing_count += 1
            entry = {
                'id': i,
                'db_id': test_entry['db_id'],
                'question': q,
                'gold_sql': g,
                'generated_sql': '',
                'exact_match': False,
                'eval_error': 'Missing in results5',
                'duration_ms': 0
            }
        deduped_data.append(entry)

    print(f"Original test size: {len(test_data)}")
    print(f"Deduplicated size: {len(deduped_data)}")
    print(f"Missing in results5: {missing_count}")
    
    with open(OUTPUT, 'w', encoding='utf-8') as f:
        json.dump(deduped_data, f, ensure_ascii=False, indent=2)
    print(f"Saved to {OUTPUT}")

if __name__ == "__main__":
    main()
