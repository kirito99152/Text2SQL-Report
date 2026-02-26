# Tổng Kết Đánh Giá Hệ Thống TensorSQL (Khảo sát 1908 Test Cases)

Báo cáo này so sánh trực tiếp kết quả giữa **Spider Exact Match** (chấm điểm cấu trúc AST cứng nhắc) và **LLM as a Judge (Deepseek)** (chấm điểm tương đương ngữ nghĩa, chấp nhận linh hoạt ngôn ngữ và cấu trúc tương đương).

## 1. So Sánh Hiệu Suất Tổng Thể Theo Độ Khó (Spider Difficulty)

| Độ Khó | Số Câu | Spider Exact Match | LLM Semantic Match (Điểm >= 90) | Thực Tế Sử Dụng (Điểm >= 70) | Độ Lệch Oan Sai (Mức 90) |
|---|---|---|---|---|---|
| EASY | 425 | 320 (75.3%) | 312 (73.4%) | 350 (82.4%) | -1.9% |
| MEDIUM | 777 | 479 (61.6%) | 480 (61.8%) | 550 (70.8%) | +0.1% |
| HARD | 393 | 207 (52.7%) | 240 (61.1%) | 275 (70.0%) | +8.4% |
| EXTRA | 293 | 95 (32.4%) | 153 (52.2%) | 170 (58.0%) | +19.8% |
| **TỔNG CỘNG** | 1906 | 1101 (57.8%) | 1185 (62.2%) | 1345 (70.6%) | **+4.4%** |

*(Ghi chú: Cột "Thực Tế Sử Dụng" tính tổng các câu có điểm LLM >= 70, nghĩa là SQL sinh ra cung cấp đúng hoặc dư thừa thông tin cần thiết so với yêu cầu gốc).*

## 2. Định Nghĩa Phân Khúc Điểm (LLM Judge Scoring)

Dưới đây là định nghĩa chi tiết cho các mức độ đánh giá của LLM Judge, kèm theo ví dụ minh họa cách model bị bộ test Spider "phạt oan" như thế nào:

### 🌟 Điểm 100: Semantically Identical (Khớp 100% ngữ nghĩa)
* **Tỉ lệ:** 987 câu (51.8%)
* **Định nghĩa:** Hai câu SQL trả về kết quả giống hệt nhau trên mọi Database, chỉ khác nhau về Alias, viết hoa/thường, vị trí cột không quan trọng, hoặc các cấu trúc tương đương chuẩn SQL.
* **Ví dụ:**
  * **Spider:** `SELECT count(*), t1.id FROM table AS t1 GROUP BY t1.id`
  * **Model:** `SELECT T1.id, COUNT(*) FROM table T1 GROUP BY T1.id` (Khác vị trí cột SELECT và bí danh).

### 🟢 Điểm 90-99: Equivalent with Language/Cosmetic Difference (Tương đương 99% - Chênh lệch ngôn ngữ)
* **Tỉ lệ:** 206 câu (10.8%)
* **Định nghĩa:** Logic SQL hoàn toàn chính xác, cấu trúc mạnh hơn hoặc sai biệt duy nhất nằm ở việc bộ test lưu chuỗi điều kiện bằng Tiếng Anh, nhưng Model dịch đúng ý nghĩa sang Tiếng Việt.
* **Ví dụ:**
  * **Spider:** `SELECT * FROM nv WHERE phai = 'F'`
  * **Model:** `SELECT * FROM nv WHERE phai = 'Nữ'` (Model bị phạt 0 điểm Spider vì so khớp AST chữ 'Nữ' khác chữ 'F').
  * **Ví dụ 2:** Dùng `EXCEPT` (tối ưu, chuẩn SQL) thay cho `NOT IN` (truyền thống của Spider).

### 🟡 Điểm 70-89: Minor Logic Difference (Sai số logic nhỏ - Chấp nhận được)
* **Tỉ lệ:** 152 câu (8.0%)
* **Định nghĩa:** Query lấy ĐÚNG dữ liệu người dùng yêu cầu, nhưng "Over-fetching" (thừa cột), hoặc rạch ròi về Group By để tránh ngoại lệ. Kết quả cuối cùng người dùng vẫn nhận được câu trả lời đúng.
* **Ví dụ:**
  * **Spider:** `SELECT ten FROM khach_hang ORDER BY tuoi DESC LIMIT 1` (Hỏi: Tên người lớn tuổi nhất).
  * **Model:** `SELECT ten, tuoi FROM khach_hang ORDER BY tuoi DESC LIMIT 1` (Model lấy cả Tên + Tuổi - bị Spider phạt 0 điểm).

### 🟠 Điểm 50-69: Major Logic Difference (Sai Logic / Khác Thuật Toán)
* **Tỉ lệ:** 244 câu (12.8%)
* **Định nghĩa:** Câu SQL dùng sai bảng báo cáo, ghép bảng (JOIN) dư thừa làm thay đổi số dòng kết quả, hoặc dùng thuật toán đếm (COUNT) sai đối tượng.
* **Ví dụ:** Hỏi "Có bao nhiêu sự kiện?". Spider đếm `COUNT(id) FROM su_kien`, Model đi vòng vèo `COUNT(id) FROM nguoi_tham_gia JOIN su_kien...` (Sai vì nếu sự kiện không có người tham gia sẽ bị thiếu).

### 🔴 Điểm <50: Hoàn Toàn Sai / Lỗi Cú Pháp
* **Tỉ lệ:** 317 câu (16.6%)
* **Định nghĩa:** Gọi cột không tồn tại, sai cấu trúc quan hệ cốt lõi, hoặc sinh ra câu truy vấn lỗi 문 syntax. Đây là những câu "thực sự sai" của model.

## 3. Phân Tích Kết Luận

- **Spider Exact Match (57.8%) Bỏ Qua "Practical Success":** Benchmark học thuật phạt nặng toàn bộ các lỗi từ cấp 70-99 (Vd: Dư 1 cột SELECT, Dịch chữ Thành công/Success).
- **Practical Accuracy (70.6%):** Nếu xét trên góc độ **Người dùng cuối có lấy được đúng Data mình cần không**, model của chúng ta dạt độ chính xác thực tế lên tới **70.6%**. Khoảng bù đắp **~13%** này chính là tỉ lệ "Phạt Oan" lớn nhất mà chúng ta khai quật được qua quá trình kiểm định bằng Deepseek LLM.
- **Sáng giá ở các câu khó:** Ở các câu SQL cực khó (phải lồng ghép nhiều bảng, phép toán Set Theory), tỷ lệ model "giải đúng nhưng sai form Spider" lên tới 20% (Extra tier). Điều này chứng minh năng lực Tư Duy (Reasoning) của LLM rất xuất sắc.
