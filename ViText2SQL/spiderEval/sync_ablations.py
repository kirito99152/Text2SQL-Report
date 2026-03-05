import json
import os

TEST_JSON = "/root/Text2SQL-Report/ViText2SQL/data/syllable-level/test.json"
ABL1 = "/root/Text2SQL-Report/ViText2SQL/benchmark_tensor_logs/benchmark_results_ablation1.json"
ABL3 = "/root/Text2SQL-Report/ViText2SQL/benchmark_tensor_logs/benchmark_results_ablation3.json"

def dedupe_results(file_path, unique_keys):
    if not os.path.exists(file_path):
        print(f"Skipping {file_path} (not found)")
        return
    
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # Create lookup for the current results
    # Use ID as primary lookup since these were derived from test.json
    res_map = {r['id']: r for r in data}
    
    new_data = []
    for test_idx in unique_keys:
        if test_idx in res_map:
            new_data.append(res_map[test_idx])
        else:
            # If missing, it's okay, rerun_eval_errors will handle it if we create a placeholder
            # But usually it should be there if the run was ongoing
            pass

    print(f"File {os.path.basename(file_path)}: {len(data)} -> {len(new_data)}")
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(new_data, f, ensure_ascii=False, indent=2)

def main():
    with open(TEST_JSON, 'r', encoding='utf-8') as f:
        test_data = json.load(f)
    
    seen_keys = set()
    unique_ids = []
    for i, d in enumerate(test_data):
        k = (d['question'].strip(), d['query'].strip())
        if k not in seen_keys:
            seen_keys.add(k)
            unique_ids.append(i)
    
    print(f"Unique IDs identified: {len(unique_ids)}")
    
    dedupe_results(ABL1, unique_ids)
    dedupe_results(ABL3, unique_ids)

if __name__ == "__main__":
    main()
