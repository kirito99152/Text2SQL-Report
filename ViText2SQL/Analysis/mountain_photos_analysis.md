# Phân Tích Hiệu Suất Dataset Mountain Photos (Spider Exact Match)

Database `mountain_photos` đạt tỉ lệ **Exact Match (41.2%)**. Đây là dataset về địa lý và nhiếp ảnh, yêu cầu các phép so sánh tập hợp và lọc dữ liệu theo nhiều tiêu chí.

## 1. Cấu Trúc Nhóm (GROUP BY Clause)
Đây là một lỗi phổ biến trong AST Match:
*   **Model:** Thường `GROUP BY` theo tất cả các cột được `SELECT` (ví dụ: `GROUP BY id, ten`) để đảm bảo tính hợp lệ trong các chuẩn SQL khắt khe.
*   **Gold SQL:** Chỉ `GROUP BY id`.
*   **Phân tích:** Cả hai cách đều cho kết quả giống hệt nhau trên SQLite, nhưng Spider đánh lỗi vì thừa cột trong `GROUP BY`.

## 2. Phép So Sánh Tập Hợp (IN vs OR)
*   **Câu hỏi:** Tìm ảnh thuộc nhãn hiệu X hoặc Y.
*   **Model:** Sử dụng toán tử `IN ('X', 'Y')`.
*   **Gold SQL:** Sử dụng chuỗi `OR` (`nhan_hieu = 'X' OR nhan_hieu = 'Y'`).
*   **Hệ quả:** Spider EM không coi `IN` và `OR` là tương đương trong quá trình so khớp AST.

## 3. Phép Trừ (NOT IN vs EXCEPT)
Tương tự các database trước, model ưu tiên `NOT IN` cho các câu hỏi phủ định ("Ảnh không được chụp bởi..."), trong khi Gold SQL dùng `EXCEPT`. Đây là điểm mất điểm định kỳ của model trong benchmark này.

## 4. Thứ Tự Sắp Xếp (Sort Order)
Khi câu hỏi yêu cầu "Sắp xếp theo số lượng" mà không nói rõ hướng, Model thường mặc định là `DESC` (giảm dần - vì thực tế thường quan tâm cái nhiều nhất trước). Gold SQL đôi khi mặc định `ASC`.

## 7. Tổng kết: Tỉ lệ "Bị phạt oan"
Qua phân tích 10/10 trường hợp lỗi của Mountain Photos:

*   **Số lượng lỗi thực tế (Real Error):** ~30% (Nhầm lẫn logic INTERSECT/AND, lấy sai cột).
*   **Số lượng bị phạt oan (Unjust Punishment):** **~70%** (Sai biệt về GROUP BY, IN/OR, NOT IN/EXCEPT).

**Kết luận:** Dataset Mountain Photos "phạt oan" model khoảng **70%** số câu lỗi. Độ chính xác thực tế về logic của model đạt khoảng **82.3%**.
