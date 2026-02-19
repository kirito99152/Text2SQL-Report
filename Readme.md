# Báo cáo Kết quả Benchmark Text-to-SQL

## 1. Tổng quan & Phương pháp

Báo cáo này tổng hợp kết quả đánh giá hiệu năng của hai mô hình/hệ thống Text-to-SQL trên tập dữ liệu tiếng Việt `syllable-level`.

### Thông tin Dataset & Môi trường
- **Dataset**: `syllable-level` (các câu hỏi tiếng Việt mức độ âm tiết).
- **Phương pháp đánh giá (Evaluation Mode)**: **Execution-based**.
    - Câu lệnh SQL sinh ra được thực thi trên database SQLite thực tế.
    - Kết quả trả về được so sánh 1:1 với kết quả của câu lệnh Gold SQL.
    - **Strict Match**: Kết quả thực thi hoàn toàn khớp.
    - **Loose Match**: (Nếu có) Kết quả khớp nhưng có thể khác biệt nhỏ (ví dụ thứ tự dòng nếu không có ORDER BY), hoặc điểm AI chấm cao.
- **Hệ thống so sánh**:
    1. **Qwen3-8B INT8 (TensorSQL)**: Hệ thống baseline/Qwen3-8B INT8 hiện tại.
    2. **DeepSeek-V3**: Mô hình DeepSeek được benchmark qua API.

## 2. Kết quả Thống kê

Dưới đây là bảng so sánh hiệu năng giữa hai mô hình dựa trên log kết quả benchmark.

| Chỉ số | Qwen3-8B INT8 (TensorSQL) | DeepSeek-V3 |
| :--- | :--- | :--- |
| **Tổng số câu hỏi (Total)** | 1499 | 1500 |
| **Độ chính xác (Strict Accuracy)** | **58.44%** (876/1499) | **58.13%** (872/1500) |
| **Độ chính xác mở rộng (Loose/AI)** | 58.44% | 51.47% (*) |
| **Thời gian trung bình (Avg Duration)** | ~64,780 ms (64.78s) | **~2,049 ms (2.05s)** |
| **Điểm trung bình (Avg Score)** | 77.43 | 80.82 |
| **Số lỗi (Errors)** | 48 | 0 |

(*) *Lưu ý: Chỉ số Loose Match của DeepSeek thấp hơn có thể do cách tính toán strict/loose trong script benchmark khác nhau hoặc do DeepSeek trả về kết quả đúng về mặt logic nhưng sai về mặt định dạng (ví dụ: thừa cột, sai tên cột) khiến việc so sánh execution thất bại ở mức độ lỏng.*

## 3. Phân tích chi tiết

### Hiệu năng (Performance)
- **Độ chính xác**: Hai mô hình có độ chính xác Execution-based gần như tương đương nhau (~58%). Qwen3-8B INT8 nhỉnh hơn một chút (0.31%).
- **Tốc độ**: **DeepSeek-V3 nhanh hơn vượt trội**, chỉ mất trung bình **2 giây** cho mỗi câu hỏi, trong khi Qwen3-8B INT8 mất tới **~65 giây**. Điều này cho thấy Qwen3-8B INT8 có thể đang chạy một quy trình rất nặng (ví dụ: suy luận local model lớn, hoặc agentic loop nhiều bước, hoặc retry nhiều lần).

### Độ ổn định (Stability)
- **DeepSeek-V3**: Không ghi nhận lỗi (Errors = 0) trong quá trình benchmark.
- **Qwen3-8B INT8**: Có **48 lỗi** xảy ra (chiếm ~3.2%), có thể do timeout, lỗi kết nối hoặc crash trong quá trình xử lý phức tạp.

## 4. Kết luận
- Nếu ưu tiên **tốc độ phản hồi**, **DeepSeek-V3** là lựa chọn tối ưu với độ chính xác ngang ngửa hệ thống hiện tại nhưng nhanh hơn gấp 30 lần.
- Hệ thống **Qwen3-8B INT8** hiện tại dù chậm hơn nhiều nhưng vẫn duy trì độ chính xác cạnh tranh. Cần xem xét tối ưu hóa thời gian thực thi của Qwen3-8B INT8 nếu muốn đưa vào ứng dụng thực tế thời gian thực.

---
*Dữ liệu được trích xuất từ logs ngày 19/02/2026.*
