# Phân Tích Kiến Trúc Pipeline & Tối Ưu Hóa VRAM (OOM Mitigation)

Hệ thống **TensorSQL** được phân tích là một kiến trúc **Multi-Stage Pipeline (Đa luồng)** kết hợp chặt chẽ với **Schema Linking** và chiến lược Fallback Prompt để giải quyết triệt để bài toán VRAM. Mô hình lõi được sử dụng là **Qwen3-8B (Quantization INT8)**, chạy trên engine suy luận tốc độ cao **TensorRT-LLM** với *default calibration*, giúp tối ưu hóa tối đa hiệu năng phục vụ (serving) trên phần cứng giới hạn.

---

## 1. Kiến Trúc Multi-Stage Pipeline

Toàn bộ quy trình sinh SQL không dồn vào một cú gọi Prompt khổng lồ mà được chia thành 4 bước độc lập, nhằm giảm tải Token ngữ cảnh và định hướng lập luận (Chain-of-Thought) cho Model:

1. **Schema Linking (Lọc Bảng - Zero-shot):**
    * **Cách thức:** Kết hợp Token matching (Local) + Mở rộng qua khóa ngoại (FK Expansion) + Xác nhận bằng AI.
    * **AI Selection:** Dùng một Prompt Zero-shot gửi đến Qwen3-8B để tự động thu hẹp danh sách hàng chục bảng xuống cực hạn (Max 10 tables). Việc sử dụng Zero-shot ở đây giúp phản hồi cực kỳ nhanh (do ít token mẫu) và Model vẫn hiểu tốt mục đích lọc dữ liệu.
2. **Logical Planning (Lập Kế Hoạch - Few-shot):**
    * Nhận vào danh sách bảng đã lọc và Schema Linking Hints.
    * Model được cấp các ví dụ rất bài bản (VD: `INTENT_TYPE: ENTITY_AGGREGATION`, rút ra `JOIN_CONDITIONS`, v.v.). Bắt buộc Model phân tích phương hướng trước khi viết Code.
3. **SQL Generation (Sinh Code Theo Plan - Few-shot):**
    * Model nhận `Query Plan` từ bước 2 và các ràng buộc luật cứng nhắc (Vd: `Không bao giờ sinh chuỗi Tiếng Việt vào WHERE`, ưu tiên dùng `EXCEPT`).
4. **Self-Check & Error Correction (Tự Động Sửa Lỗi):**
    * Nếu hệ thống phát hiện lỗi (nhầm Cột, lỗi Ambiguous name, lỗi Aggregate không có Group By...), nó sẽ bốc lỗi đó ném lại cho Model cùng với Prompt sửa lỗi chuyên dụng.

---

## 2. Rủi Ro Tràn Bộ Nhớ (Out-Of-Memory / OOM) 

Với các model mạnh có khả năng "Thinking" hoặc làm theo CoT (Chain-of-Thought), một Prompt quá chi tiết và chứa quá nhiều ví dụ sẽ kích thích Model sinh ra các đoạn **Reasoning Token (Token suy luận)** cực dài. 

Theo Note trong Source code:
* Phiên bản Prompt V2 mới (với đầy đủ ví dụ và giải thích dài dòng) làm lượng Reasoning Token tăng vọt, tiêu tốn **21-22GB VRAM** - vượt ngưỡng phần cứng mục tiêu (chỉ có 16GB VRAM, ví dụ RTX 4080 hoặc Tesla T4).

---

## 3. Chiến Lược Giảm Tải: Lớp Phòng Thủ `prompts_retry.js`

Để vừa giữ được sự hướng dẫn chi tiết của Few-shot, vừa tránh bị Timeout / OOM khi Server quá tải, hệ thống sử dụng một bộ thư viện Prompt dự phòng là `prompts_retry.js`.

### Bản chất của `prompts_retry.js`:
Đây là kỹ thuật **"Nén Hướng Dẫn" (Instruction Compression)**. Khi lệnh sinh bị thất bại vì lỗi OOM, Timeout, hoặc sinh Reasoning quá dài, API sẽ tự động Fallback gọi lại bằng bộ Prompt này.

**Sự khác biệt so với Prompt chính (`prompts.js`):**
1. **Loại bỏ toàn bộ phần Example (Chuyển từ Few-shot -> Zero-shot):** Xóa toàn bộ các ví dụ (như Ex1, Ex2...) làm mẫu đi kèm.
2. **Cắt các đoạn "Giải thích lý do":** Thay vì giải thích tại sao không được dùng `LEFT JOIN IS NULL`, Prompt chỉ ra lệnh cứng: `⛔ NEVER LEFT JOIN...IS NULL`.
3. **Bổ sung chỉ thị kiềm chế Suy Nghĩ:** Thêm câu thần chú `Think step by step but keep reasoning SHORT.` (Bắt buộc Model suy luận ngắn gọn nhất có thể).

### Hiệu quả kỹ thuật:
* **Token Vận Theo (Input Tokens):** Giảm **40-50%** lượng chữ phải tải vào Card đồ họa.
* **Token Sinh Ra (Reasoning Tokens):** Giảm **50-60%** do không còn Example để Model có thói quen "bắt chước" việc ngồi lảm nhảm dài dòng so sánh đối chiếu.
* VRAM Impact: Ép mức VRAM định đỉnh từ 22GB xuống chỉ còn **15-17GB**. Điều này mang tính sống còn để Model **Qwen3-8B INT8 (chạy qua TensorRT-LLM Default Calibration)** có thể trụ vững nhả ra SQL thành công trong ngưỡng phần cứng bị giới hạn (16GB VRAM) mà không bị crash engine c++ bên dưới Cuda.

**Tiểu Kết:** Pipeline này kết hợp sức mạnh phân tích sâu của Few-shot (để đảm bảo độ chính xác) và sự an toàn về hiệu năng của Compact Zero-shot (như một cái phanh an toàn chống Tràn VRAM). Đây là một Server-Architecture thiết kế cho môi trường Production thực tế.
