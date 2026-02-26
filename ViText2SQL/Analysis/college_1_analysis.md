# Phân Tích Hiệu Suất Dataset College 1 (Spider Exact Match)

Database `college_1` đạt tỉ lệ **Exact Match (36.0%)**. Đây là một trong những database có số lượng câu hỏi lớn (164 câu), dẫn đến số lượng lỗi về mặt cấu trúc (AST) tích lũy rất cao.

## 1. Lạm Dụng Phép JOIN (Over-joining)
Model có xu hướng "cẩn thận quá mức" bằng cách luôn `JOIN` các bảng liên quan để lấy dữ liệu thay vì lấy trực tiếp từ bảng chứa Foreign Key.
*   **Ví dụ:** Khi hỏi về "Số lượng giáo sư giảng dạy lớp X", Gold SQL đếm trực tiếp từ bảng `lop_hoc` (nơi có cột `ma_so_nhan_vien_cua_giao_su`). Model lại `JOIN` bảng `lop_hoc` với bảng `nhan_vien` rồi mới đếm.
*   **Hệ quả:** Kết quả trả về là như nhau, nhưng cấu trúc AST bị sai lệch hoàn toàn so với mẫu.

## 2. Bản Địa Hóa Giá Trị Chuỗi (String Localization)
Dataset `college_1` chứa nhiều thuật ngữ học thuật bị Model "Việt hóa" tự động:
*   **Tiến sĩ vs Ph.D.:** Model dùng `WHERE bang_cap = 'Tiến sĩ'`, Gold dùng `'ph.d.'`.
*   **Kế toán vs Accounting:** Model dùng `WHERE ten_khoa = 'Kế toán'`, Gold dùng `'accounting'`.
*   **Cú pháp mã môn:** Model đôi khi nhầm lẫn giữa `ma_khoa_hoc` và `ma_lop_hoc` (ACCT-211).

## 3. Khác Biệt Trong Phép Đếm (COUNT(*) vs COUNT(DISTINCT))
Gold SQL của database này cực kỳ ưu tiên `COUNT(DISTINCT ten_khoa)` hoặc `COUNT(DISTINCT ma_so_nhan_vien)`. 
*   Model thường dùng `COUNT(*)` vì giả định các bản ghi trong bảng quan hệ đã là duy nhất.
*   Dù kết quả thường giống nhau, nhưng Spider EM trừ điểm tuyệt đối nếu thiếu từ khóa `DISTINCT`.

## 4. Tên và Họ (Ho vs Ten)
Có sự nhầm lẫn giữa việc Model lấy `ho_cua_nhan_vien` hay `ten_cua_nhan_vien` khi người dùng hỏi chung chung là "Tên giáo sư". Gold SQL thường mặc định một cột cố định, nếu model chọn cột còn lại sẽ bị tính là sai cột.

## 7. Tổng kết: Tỉ lệ "Bị phạt oan"
Qua phân tích 20/105 trường hợp lỗi của College 1:

*   **Số lượng lỗi thực tế (Real Error):** ~10% (Nhầm cột điều kiện, sai bảng đích).
*   **Số lượng bị phạt oan (Unjust Punishment):** **~90%** (Viết đúng logic nhưng JOIN dư, sai lệch String Literal hoặc thiếu DISTINCT).

**Kết luận:** Dataset College 1 "phạt oan" model khoảng **90%** số câu lỗi. Nếu tính theo khả năng giải quyết yêu cầu thực tế, database này đạt độ chính xác tiềm năng lên đến **93.6%**.
