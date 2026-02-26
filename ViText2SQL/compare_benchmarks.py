import json
import sys

def compare_benchmarks(old_file, new_file):
    try:
        with open(old_file, 'r', encoding='utf-8') as f:
            old_data = json.load(f)
        with open(new_file, 'r', encoding='utf-8') as f:
            new_data = json.load(f)
    except Exception as e:
        print(f"Lỗi khi đọc file: {e}")
        return

    # Map ID to status
    old_results = {}
    for item in old_data:
        if 'id' in item:
            old_results[item['id']] = item.get('exact_match', False)
        else:
            print(f"Bỏ qua 1 item thiếu 'id' trong file cũ")

    new_results = {}
    for item in new_data:
        if 'id' in item:
            new_results[item['id']] = item.get('exact_match', False)
        # We don't need to alert for extra items in new_results since we only care about common ones

    common_ids = sorted([id for id in old_results if id in new_results])
    
    total = len(common_ids)
    old_correct = 0
    new_correct = 0
    improved = []
    regressed = []
    both_correct = 0
    both_wrong = 0

    for id in common_ids:
        old_status = old_results[id]
        new_status = new_results[id]
        
        if old_status: old_correct += 1
        if new_status: new_correct += 1
        
        if not old_status and new_status:
            improved.append(id)
        elif old_status and not new_status:
            regressed.append(id)
        elif old_status and new_status:
            both_correct += 1
        else:
            both_wrong += 1

    print(f"--- Kết quả so sánh (chỉ cho {total} IDs chung) ---")
    print(f"Tổng số ID đối chiếu: {total}")
    print(f"Số câu đúng ở bản cũ: {old_correct} ({old_correct/total*100:.2f}%)")
    print(f"Số câu đúng ở bản mới: {new_correct} ({new_correct/total*100:.2f}%)")
    print(f"Cải thiện (Sai -> Đúng): {len(improved)}")
    print(f"Tụt lùi (Đúng -> Sai): {len(regressed)}")
    print(f"Giữ nguyên Đúng: {both_correct}")
    print(f"Giữ nguyên Sai: {both_wrong}")
    
    if improved:
        print(f"\nDanh sách ID cải thiện (10 cái đầu): {improved[:10]}")
    if regressed:
        print(f"\nDanh sách ID tụt lùi (10 cái đầu): {regressed[:10]}")

if __name__ == "__main__":
    old = "/root/Text2SQL-Report/ViText2SQL/benchmark_tensor_logs/benchmark_results4.json"
    new = "/root/Text2SQL-Report/ViText2SQL/benchmark_tensor_logs/benchmark_results.json"
    compare_benchmarks(old, new)
