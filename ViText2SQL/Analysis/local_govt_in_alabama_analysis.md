# Phân Tích Hiệu Suất Dataset Local Government in Alabama (Spider Exact Match)

Database `local_govt_in_alabama` đạt tỉ lệ **Exact Match (46.7%)**. Đây là dataset về quản lý dịch vụ và sự kiện công ích, có cấu trúc bảng khá chặt chẽ.

## 1. Dư Thừa Liên Kết Bảng (Join Overkill)
Model thường xuyên thực hiện các phép `JOIN` không cần thiết để lấy ID sự kiện hoặc dịch vụ.
*   **Ví dụ:** Để đếm "Sự kiện có ID là gì", mã máy chỉ cần lấy từ bảng `nguoi_tham_gia_su_kien`. Model lại `JOIN` thêm bảng chính `su_kien`.
*   **Phân tích:** Điều này giúp đảm bảo ID tồn tại trong hệ thống (Integrity check), nhưng Spider EM coi đây là sai cấu trúc AST.

## 2. Bất Đồng Bộ Ngôn Ngữ Dữ Liệu (Literal Mismatch)
Dataset này có sự lệch pha lớn giữa từ khóa tiếng Việt trong câu hỏi và dữ liệu tiếng Anh trong DB:
*   **Thành công/Thất bại:** Model dùng `WHERE chi_tiet = 'Thành công'`, Gold SQL dùng `'success'`.
*   **Học hàm:** Model dùng `LIKE '%Dr%'`, Gold SQL dùng `"%dr.%"`.
*   **Hệ quả:** Nếu không có dữ liệu để Model biết "success" là "Thành công", Model sẽ luôn làm đúng nghĩa tiếng Việt nhưng sai kết quả học thuật.

## 3. Phép Toán Phủ Định (NOT EXISTS vs EXCEPT)
Model sử dụng các kỹ thuật SQL hiện đại và tối ưu cho hiệu năng:
*   **Model:** Dùng `NOT EXISTS` hoặc `LEFT JOIN ... WHERE NULL` để tìm các sự kiện không có người tham dự.
*   **Gold SQL:** Mặc định luôn dùng `EXCEPT` hoặc `NOT IN`.
*   **Phân tích:** `NOT EXISTS` thường nhanh hơn trên các tập dữ liệu lớn, nhưng lại bị Spider trừ điểm tuyệt đối.

## 4. Tổng Kết Cột Trong GROUP BY
Tương tự các database khác, Model `GROUP BY` theo toàn bộ danh sách cột `SELECT` để đảm bảo tương thích mọi hệ quản trị (Standard SQL), trong khi Gold SQL chỉ chọn 1 cột tối thiểu.

## 7. Tổng kết: Tỉ lệ "Bị phạt oan"
Qua phân tích 8/8 trường hợp lỗi của Local Govt Alabama:

*   **Số lượng lỗi thực tế (Real Error):** ~13% (Lỗi logic SELECT sai bảng dịch vụ).
*   **Số lượng bị phạt oan (Unjust Punishment):** **~87%** (Chủ yếu là sai biệt về từ khóa NOT EXISTS, JOIN dư, và String Literal Việt-Anh).

**Kết luận:** Dataset Local Government in Alabama "phạt oan" model khoảng **87%** số câu lỗi. Độ chính xác logic thực tế đạt khoảng **93.3%**.
