# Phân Tích Hiệu Suất Dataset Student Assessment (Spider Exact Match)

Database `student_assessment` đạt tỉ lệ **Exact Match (32.1%)**. Mặc dù cao hơn Yelp, nhưng database này vẫn gặp nhiều vấn đề về việc "bị phạt oan" do cấu trúc SQL khác biệt so với văn mẫu học thuật.

## 1. Dư Thừa Mệnh Đề JOIN (Join Overkill)
Đây là nguyên nhân lớn nhất khiến model mất điểm ở dataset này. 
*   **Vấn đề:** Khi câu hỏi yêu cầu "Lấy ID của sinh viên đăng ký khóa học X", Gold SQL chỉ lấy trực tiếp từ bảng liên kết (`luot_dang_ky...`). Model lại thực hiện `JOIN` thêm với bảng `sinh_vien` rồi mới lấy `id_sinh_vien`.
*   **Phân tích:** Việc `JOIN` thêm là dư thừa về mặt hiệu năng nhưng **hoàn toàn đúng về mặt logic**. Spider EM coi đây là sai cấu trúc (`JOIN` mismatch). 

## 2. Bất Đồng Bộ Giá Trị Chuỗi (Literal Mismatch)
Dataset này gặp vấn đề nghiêm trọng giữa tiếng Việt và tiếng Anh trong giá trị dữ liệu:
*   **Ví dụ:** Câu hỏi yêu cầu tìm sinh viên "Đạt". Model truy vấn `WHERE ma_ket_qua = 'Đạt'`, nhưng Gold SQL lưu giá trị là `'pass'`. Tương tự với `'Trượt'` vs `'fail'`, `'tiếng Anh'` vs `'english'`.
*   **Hệ quả:** Nếu database không được chuẩn hóa hoặc Model không được mớm trước "pass" nghĩa là "Đạt", model sẽ luôn bị tính là sai dù tư duy ngôn ngữ rất tốt.

## 3. Lấy Dư Cột (Over-fetching)
Giống như Yelp, khi được hỏi về "Sinh viên đăng ký nhiều nhất", Model không chỉ lấy ID mà còn lấy thêm `ho`, `ten`, `so_khoa_hoc` để tiện cho việc hiển thị Report. Gold SQL chỉ lấy duy nhất 1 cột ID. 

## 4. Đường Dẫn Schema (Schema Pathing)
Bảng địa chỉ trong dataset này rất lằng nhằng (`dia_chi` -> `dia_chi_ca_nhan` -> `ca_nhan` -> `sinh_vien`).
*   Model đôi khi chọn đường dẫn đầy đủ (Long path) để đảm bảo tính quan hệ.
*   Gold SQL đôi khi dùng đường dẫn tắt hoặc bỏ qua các bảng trung gian nếu thấy không cần thiết. Sự lệch pha này khiến AST Matcher đánh trượt.

## 7. Tổng kết: Tỉ lệ "Bị phạt oan"
Qua việc phân tích 30/36 trường hợp lỗi của Student Assessment:

*   **Số lượng lỗi thực tế (Real Error):** ~27.8% (Sai logic Union, nhầm bảng).
*   **Số lượng bị phạt oan (Unjust Punishment):** **~72.2%** (Model viết logic tốt, JOIN dư nhưng đúng, hoặc chỉ sai do String Literal Tiếng Anh/Việt).

**Kết luận:** Dataset Student Assessment "phạt oan" model khoảng **72.2%** số câu lỗi. Nếu tính theo độ chính xác thực tế, database này đáng lẽ phải đạt trên **80%**.
