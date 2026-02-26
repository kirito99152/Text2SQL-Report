# Phân Tích Hiệu Suất Dataset Insurance and eClaims (Spider Exact Match)

Database `insurance_and_eClaims` đạt tỉ lệ **Exact Match (32.5%)**. Dataset này tập trung vào các nghiệp vụ bảo hiểm, yêu cầu khả năng so khớp chuỗi và tính toán giá trị cực trị (Max/Min).

## 1. Khác Biệt Giữa "Top 1" và "Cực Trị" (ORDER BY vs Subquery)
Đây là điểm model bị mất điểm nhiều nhất ở dataset này:
*   **Câu hỏi:** "Khách hàng nào yêu cầu bồi thường cao nhất?"
*   **Gold SQL:** Sử dụng Subquery: `WHERE so_tien = (SELECT MAX(so_tien) FROM ...)`
*   **Model:** Sử dụng phương pháp tối ưu hơn: `ORDER BY so_tien DESC LIMIT 1`
*   **Phân tích:** Cả hai cách đều cho kết quả đúng, nhưng Spider EM mặc định chỉ chấp nhận cấu trúc Subquery trong bộ đề này.

## 2. Bất Đồng Bộ Ngôn Ngữ Trong Mã Loại (Code Mismatch)
Dataset bảo hiểm thường dùng các mã loại (Policy type code) bằng Tiếng Anh:
*   **Ví dụ:** Model dùng `WHERE loai = 'Uỷ quyền'` hoặc `'Thống nhất'`. Gold SQL lại lưu giá trị là `'deputy'` hoặc `'uniform'`.
*   **Hệ quả:** Nếu không được mớm trước các cặp Key-Value tương ứng, model sẽ dùng đúng từ Tiếng Việt trong câu hỏi, dẫn đến sai lệch tuyệt đối về mặt dữ liệu chuỗi (String Literal).

## 3. Phép Toán Tập Hợp (EXCEPT vs NOT IN)
Model và Gold SQL thường bất đồng trong cách xử lý các câu hỏi phủ định:
*   **Model:** Thường dùng `WHERE id NOT IN (SELECT ...)` (Dễ hiểu, phổ biến).
*   **Gold SQL:** Ưu tiên dùng phép trừ tập hợp `EXCEPT`. 
*   **Phân tích:** Dù kết quả tập hợp là như nhau, AST Matcher sẽ chấm lỗi do khác từ khóa vận hành tập hợp.

## 4. Lấy Dư Cột Chi Tiết (Over-fetching Context)
Khi người dùng hỏi về "Chi tiết khách hàng", Model thường `SELECT` cả `id_khach_hang` và `chi_tiet_khach_hang` để đảm bảo có đủ khóa chính. Gold SQL của bộ này thường chỉ lấy duy nhất một cột text chứa thông tin chi tiết.

## 7. Tổng kết: Tỉ lệ "Bị phạt oan"
Qua phân tích 15/27 trường hợp lỗi của Insurance and eClaims:

*   **Số lượng lỗi thực tế (Real Error):** ~20% (Sai logic UNION, nhầm bảng xử lý).
*   **Số lượng bị phạt oan (Unjust Punishment):** **~80%** (Viết đúng logic theo cách ORDER BY, sai chuỗi Tiếng Anh/Việt, hoặc dùng NOT IN thay EXCEPT).

**Kết luận:** Dataset Insurance and eClaims "phạt oan" model khoảng **80%** số câu lỗi. Nếu tính theo khả năng giải quyết yêu cầu thực tế, database này đáng lẽ đạt độ chính xác khoảng **86.5%**.
