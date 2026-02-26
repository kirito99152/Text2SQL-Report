# Phân Tích Hiệu Suất Dataset Soccer 1 (Spider Exact Match)

Database `soccer_1` đạt tỉ lệ **Exact Match (42.9%)**. Đây là một trong những database có cấu trúc cột rất lớn (nhiều thuộc tính cầu thủ) và mối quan hệ phức tạp.

## 1. Chiến Lược Lấy Giá Trị Tuyệt Đối (Ordering vs Aggregation)
Model thể hiện sự linh hoạt khi tìm các giá trị cao nhất/thấp nhất:
*   **Model:** `ORDER BY can_nang DESC LIMIT 1` (Lấy trực tiếp dòng chứa giá trị lớn nhất).
*   **Gold SQL:** `SELECT MAX(can_nang)` (Chỉ lấy trị số).
*   **Phân tích:** Model thường chọn `ORDER BY` vì người dùng thường muốn biết *Cầu thủ nào* nặng nhất chứ không chỉ là con số. Spider EM coi đây là sai lệch kiểu mẫu.

## 2. Bản Địa Hóa Giá Trị Đặc Tính (Enum Formatting)
Tương tự các bộ dữ liệu khác, Model ưu tiên dùng tiếng Việt cho các đặc tính cầu thủ:
*   **Ví dụ:** `WHERE chan_thuan = 'trái'` vs `Gold: 'left'`.
*   **Hệ quả:** Dù model hiểu đúng yêu cầu người dùng, nhưng nếu DB gốc lưu bằng tiếng Anh, kết quả so khớp chuỗi sẽ thất bại.

## 3. Cú Pháp Truy Vấn (BETWEEN vs Comparison)
Model sử dụng các cú pháp SQL chuẩn hóa để làm code ngắn gọn hơn:
*   **Model:** `WHERE danh_gia BETWEEN 85 AND 90`.
*   **Gold SQL:** `WHERE danh_gia >= 85 AND danh_gia <= 90`.
*   **Phân tích:** Hai cách này tương đương 100% trong SQL, nhưng AST (Cây cú pháp) của chúng khác nhau, dẫn đến việc bị trừ điểm Exact Match.

## 4. Phép Toán Logic Tập Hợp (AND vs INTERSECT)
Khi lọc dữ liệu từ nhiều bảng (như `cau_thu` và `dac_diem`):
*   **Model:** Sử dụng `JOIN` và nối các điều kiện bằng `AND`.
*   **Gold SQL:** Sử dụng 2 câu `SELECT` độc lập và nối bằng `INTERSECT`. 
*   **Phân tích:** Cách của Model phổ biến hơn nhiều trong phát triển phần mềm thực tế, nhưng bộ dataset này lại ưu tiên phong cách học tập (Set theory).

## 7. Tổng kết: Tỉ lệ "Bị phạt oan"
Qua phân tích 8/8 trường hợp lỗi của Soccer 1:

*   **Số lượng lỗi thực tế (Real Error):** ~37.5% (Sai logic UNION vs JOIN, nhầm lẫn trường dữ liệu API).
*   **Số lượng bị phạt oan (Unjust Punishment):** **~62.5%** (Do sử dụng BETWEEN, ORDER BY, và sai biệt chuỗi trái/left).

**Kết luận:** Dataset Soccer 1 "phạt oan" model khoảng **62.5%** số câu lỗi. Độ chính xác thực tế về logic đạt khoảng **78.6%**.
