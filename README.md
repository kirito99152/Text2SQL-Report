# Tài liệu Báo cáo Benchmark ViText2SQL

## Tổng quan
Thư mục này chứa các báo cáo chi tiết về kết quả benchmark cho bài toán **Text-to-SQL** trên tập dữ liệu tiếng Việt (**ViText2SQL**).

Mục tiêu chính là so sánh hiệu năng giữa hai phương pháp tiếp cận:
1.  **Agent Pipeline (Local)**: Sử dụng mô hình **Qwen3-8B INT8** chạy local với quy trình Agent (Reasoning -> Generation -> Refinement).
2.  **API-based Model**: Sử dụng mô hình **DeepSeek-V3** thông qua API.

## Tài liệu Chi tiết
Vui lòng xem báo cáo đầy đủ tại:
👉 **[Báo cáo Kết quả Benchmark (Benchmark-report.md)](Benchmark-report.md)**

### Nội dung chính của báo cáo:
- **Phương pháp đánh giá**: Sử dụng **AI Judge** để chấm điểm sự tương đồng ngữ nghĩa (Semantic Equivalence) do thiếu môi trường thực thi đầy đủ.
- **Kết quả**: So sánh độ chính xác (Accuracy), thời gian phản hồi (Latency), và tài nguyên tiêu thụ.
- **Phân tích**: Đánh giá ưu/nhược điểm của việc chạy model local (bảo mật, tự chủ) so với dùng API (nhanh, chính xác cao hơn).
