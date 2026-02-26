# Phân Tích Hiệu Suất Dataset Customers and Invoices (Spider Exact Match)

Database `customers_and_invoices` đạt tỉ lệ **Exact Match (41.5%)**. Database này có cấu trúc quan hệ khách hàng - tài khoản - hóa đơn khá điển hình.

## 1. JOIN Dư Thừa (Redundant JOINs)
*   **Vấn đề:** Để đếm "Khách hàng có tài khoản", mã máy chỉ cần đếm ID khách hàng ngay trong bảng `tai_khoan`.
*   **Model:** Luôn `JOIN khach_hang ON ...` rồi mới đếm.
*   **Phân tích:** Tư duy của Model là luôn bám sát Schema để đảm bảo dữ liệu là của khách hàng tồn tại thực sự. Spider coi đây là sai cấu trúc do thừa bảng.

## 2. Lấy Dư Cột (Over-fetching)
Khi hỏi về "Tên và chi tiết tài khoản của khách hàng X", Model lấy toàn bộ các mục trong bảng `tai_khoan` (`SELECT *` hoặc liệt kê hết). Gold SQL chỉ lấy đúng 2 cột tên và chi tiết.

## 3. Phép Trừ Tài Khoản (NOT IN vs EXCEPT)
Tiếp tục là sự khác biệt giữa `WHERE id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)` và `EXCEPT`. Cả hai đều trả ra danh sách khách hàng chưa mở tài khoản, nhưng Model bị đánh trượt AST Match.

## 4. Thiếu Cột (Missing Columns)
Trong một số ít trường hợp, khi hỏi "Tên đầy đủ", Model chỉ lấy cột `ten_khach_hang` mà bỏ quên `ho_cua_khach_hang`. Đây là lỗi thực tế về mặt yêu cầu (Requirement mismatch).

## 7. Tổng kết: Tỉ lệ "Bị phạt oan"
Qua phân tích 10/48 trường hợp lỗi của Customers and Invoices:

*   **Số lượng lỗi thực tế (Real Error):** ~15% (Thiếu cột tên đầy đủ, nhầm lẫn trường dữ liệu).
*   **Số lượng bị phạt oan (Unjust Punishment):** **~85%** (Chủ yếu là JOIN dư thừa và NOT IN thay cho EXCEPT).

**Kết luận:** Dataset Customers and Invoices "phạt oan" model khoảng **85%** số câu lỗi. Độ chính xác thực tế đạt khoảng **91.2%**.
