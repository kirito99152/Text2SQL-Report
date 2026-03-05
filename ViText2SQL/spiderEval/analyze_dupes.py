import json
from collections import Counter

def analyze():
    test_path = '/root/Text2SQL-Report/ViText2SQL/data/syllable-level/test.json'
    results5_path = '/root/Text2SQL-Report/ViText2SQL/benchmark_tensor_logs/benchmark_results5.json'
    
    test_data = json.load(open(test_path))
    print(f"test.json length: {len(test_data)}")
    
    test_counts = Counter((d['question'].strip(), d['query'].strip()) for d in test_data)
    duplicates = {k: v for k, v in test_counts.items() if v > 1}
    print(f"Duplicates in test.json: {len(duplicates)}")
    for k, v in duplicates.items():
        print(f"  - Query/Gold: {k} | Count: {v}")
    
    if os.path.exists(results5_path):
        results5_data = json.load(open(results5_path))
        print(f"results5.json length: {len(results5_data)}")
        res_counts = Counter((d['question'].strip(), d['gold_sql'].strip()) for d in results5_data)
        res_duplicates = {k: v for k, v in res_counts.items() if v > 1}
        print(f"Duplicates in results5.json: {len(res_duplicates)}")

if __name__ == "__main__":
    import os
    analyze()
