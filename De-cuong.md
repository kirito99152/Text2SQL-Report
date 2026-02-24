# CHƯƠNG 2: THIẾT KẾ VÀ PHÁT TRIỂN PHẦN MỀM THỐNG KÊ, BÁO CÁO THÔNG MINH DỰA TRÊN MÔ HÌNH NGÔN NGỮ LỚN

## 2.1. Triển khai mô hình ngôn ngữ lớn trên mạng nội bộ

### 2.1.1. Phân tích yêu cầu triển khai

Ứng dụng Thống kê, Báo cáo Thông minh hướng đến **4 nhóm tính năng cốt lõi**, tất cả đều được xây dựng dựa trên nền tảng mô hình ngôn ngữ lớn (LLM):

| # | Tính năng | Mô tả |
|---|-----------|-------|
| 1 | **Truy vấn dữ liệu bằng ngôn ngữ tự nhiên (NLQ)** | Cho phép người dùng không có chuyên môn kỹ thuật đặt câu hỏi bằng tiếng Việt để trích xuất số liệu, thay vì phải viết SQL |
| 2 | **Tự động hóa báo cáo** | Hệ thống tự động tổng hợp thông tin, tạo báo cáo định kỳ (tháng, quý, năm) và thuyết minh dữ liệu bằng ngôn ngữ mạch lạc, dễ hiểu |
| 3 | **Phân tích và phát hiện Insight** | Sử dụng AI để nhận diện xu hướng, phát hiện các mối liên hệ ẩn hoặc điểm bất thường trong dữ liệu mà phương pháp truyền thống khó nhận thấy |
| 4 | **Trực quan hóa thông minh** | Tự động đề xuất và vẽ các loại biểu đồ phù hợp (cột, đường, tròn) dựa trên cấu trúc dữ liệu trả về |

Trong đó, module **Text-to-SQL** (tính năng 1) đóng vai trò nền tảng — là "cầu nối" cho phép LLM tương tác với cơ sở dữ liệu. Các tính năng còn lại (2, 3, 4) được xây dựng dựa trên khả năng truy xuất dữ liệu từ module này.

**Đối tượng phục vụ:**
- Cán bộ quản lý — hỗ trợ ra quyết định dựa trên dữ liệu.
- Chuyên gia phân tích — khai thác dữ liệu nhanh chóng mà không cần kỹ năng lập trình.
- Nhân viên nghiệp vụ — tự trích xuất số liệu phục vụ công việc hàng ngày.

**Phạm vi dữ liệu:** Quản lý đa lĩnh vực — đào tạo, nghiên cứu khoa học, quản lý học viên, tổ chức cán bộ và an ninh nội bộ.

#### Các ràng buộc đặc thù

**Bảo mật:**
- Toàn bộ dữ liệu và truy vấn phải được xử lý **hoàn toàn nội bộ** (On-premise), không gửi ra API bên ngoài.
- Mô hình hoạt động trong mạng nội bộ cô lập, không phụ thuộc vào dịch vụ AI nước ngoài.

**Tài nguyên hạn chế (Low-resource):**
- Chỉ có 1 card GPU trung cấp (NVIDIA A4000 — 16GB VRAM).
- Không có ngân sách cho API trả phí hoặc cluster GPU hiệu năng cao.

**Ngôn ngữ:**
- Hỗ trợ tốt **tiếng Việt** — cả câu hỏi tự nhiên, schema tiếng Việt (có dấu), và giá trị dữ liệu tiếng Việt.

### 2.1.2. Lựa chọn mô hình ngôn ngữ lớn

#### Các mô hình ứng viên

| Mô hình | Kích thước | VRAM cần | Hỗ trợ TV | On-premise | Đánh giá |
|---------|-----------|----------|-----------|------------|----------|
| GPT-4o (OpenAI) | ~1.8T (ước tính) | N/A (API) | Tốt | ❌ | Không — vi phạm bảo mật |
| DeepSeek-V3 | ~658B (MoE) | >200GB | Tốt | ❌ Quá lớn | Chỉ dùng để benchmark |
| **Qwen3-8B** | **8B** | **~12GB (INT8)** | **Rất tốt** | **✅** | **Được chọn** |
| Llama 3.1 8B | 8B | ~12GB | Trung bình | ✅ | Dự phòng |

#### Lý do chọn Qwen3-8B INT8

1. **Vừa vặn VRAM**: ~12GB trên card 16GB, còn dư cho inference buffer.
2. **Hỗ trợ tiếng Việt xuất sắc**: Được huấn luyện trên bộ dữ liệu đa ngôn ngữ lớn, bao gồm tiếng Việt chất lượng cao.
3. **Thinking mode tích hợp**: Qwen3 có khả năng suy luận (reasoning) tích hợp sẵn, rất phù hợp cho Agent Pipeline nhiều bước.
4. **Mã nguồn mở**: Cộng đồng lớn, dễ dàng tùy chỉnh và tối ưu.
5. **INT8 Quantization**: Giảm 50% kích thước mà gần như không mất chất lượng (< 2% giảm accuracy).

### 2.1.3. Kiến trúc hệ thống hạ tầng

#### Sơ đồ kiến trúc tổng quan

```
┌──────────────────────────────────────────────────────────────────┐
│                         MẠNG NỘI BỘ                              │
│                                                                  │
│  ┌──────────┐     ┌─────────────────────────┐     ┌───────────┐  │
│  │ Frontend │────▸│      Backend API         │────▸│ Qwen3-8B  │  │
│  │ (Web UI) │◂───│      (Node.js)           │     │ (vLLM/    │  │
│  │          │     │                         │     │  Ollama)  │  │
│  │ - NLQ    │     │ ┌─────────────────────┐ │     └───────────┘  │
│  │ - Báo cáo│     │ │ Module Text-to-SQL  │ │            │       │
│  │ - Biểu đồ│     │ │ (Agent Pipeline)    │ │     ┌───────────┐  │
│  │ - Insight│     │ ├─────────────────────┤ │     │ GPU Server│  │
│  └──────────┘     │ │ Module Báo cáo      │ │     │ A4000     │  │
│                   │ ├─────────────────────┤ │     │ 16GB VRAM │  │
│                   │ │ Module Insight       │ │     └───────────┘  │
│                   │ ├─────────────────────┤ │                    │
│                   │ │ Module Trực quan hóa │ │                    │
│                   │ └─────────────────────┘ │                    │
│                   └────────────┬────────────┘                    │
│                                │                                 │
│                   ┌────────────▼────────────┐                    │
│                   │   Cơ sở dữ liệu        │                    │
│                   │   (SQLite / MSSQL)      │                    │
│                   └─────────────────────────┘                    │
└──────────────────────────────────────────────────────────────────┘
```

#### Thông số phần cứng GPU Server

| Thành phần | Thông số |
|-----------|----------|
| **GPU** | NVIDIA RTX A4000 |
| **GPU VRAM** | 16GB GDDR6 |
| **CPU** | 4 vCPU |
| **RAM** | 21GB DDR4 |
| **Storage** | SSD NVMe ≥ 100GB |
| **OS** | Ubuntu 22.04 LTS |
| **Runtime** | CUDA 12.x + Python 3.10+ |

### 2.1.4. Chiến lược bù đắp năng lực: Agent Pipeline thay vì Fine-tuning

Trong bối cảnh low-resource, việc fine-tune một mô hình chuyên biệt đòi hỏi dữ liệu lớn, quá trình huấn luyện tốn kém và kết quả khó kiểm soát. Thay vào đó, chúng tôi áp dụng phương pháp **Agent Pipeline** — sử dụng mô hình general-purpose nhỏ kết hợp với quy trình suy luận nhiều bước để bù đắp sự thiếu hụt tri thức chuyên sâu.

#### So sánh hai hướng tiếp cận

| Tiêu chí | Fine-tuning chuyên biệt | Agent Pipeline (đề xuất) |
|----------|-------------------------|--------------------------|
| **Dữ liệu cần** | Hàng nghìn cặp (câu hỏi, SQL) | Không cần dữ liệu huấn luyện |
| **Thời gian chuẩn bị** | Vài tuần – vài tháng | Triển khai ngay |
| **Chi phí GPU (training)** | Cao (cần multi-GPU) | Không có (chỉ inference) |
| **Linh hoạt với schema mới** | Cần fine-tune lại | Tự động thích nghi |
| **Bảo trì khi model mới** | Fine-tune lại từ đầu | Chỉ đổi model base |
| **Rủi ro overfitting** | Cao | Không có |

#### Quy trình Agent Pipeline cho Text-to-SQL

```
Câu hỏi (TV) ──▸ [Reasoning] ──▸ [Schema Discovery] ──▸ [SQL Generation] ──▸ [Refinement] ──▸ SQL
                     │                    │                      │                   │
                     ▼                    ▼                      ▼                   ▼
                Phân tích          Dùng Tool tìm           Sinh SQL             Kiểm tra &
                ý định             bảng/cột phù hợp        ban đầu             sửa lỗi
```

- **Reasoning**: Phân tích câu hỏi tiếng Việt, xác định ý định truy vấn.
- **Schema Discovery**: Sử dụng **tool calling** để truy vấn metadata CSDL — tìm bảng, cột, khóa ngoại liên quan.
- **SQL Generation**: Sinh câu SQL dựa trên context đã thu thập.
- **Refinement**: Tự kiểm tra và sửa lỗi cú pháp, logic trước khi trả kết quả.

> **Kết quả benchmark**: Agent Pipeline giúp model 8B đạt **~92% hiệu năng** so với model 658B (DeepSeek-V3), trong khi nhỏ hơn ~80 lần và chạy hoàn toàn nội bộ. *(Chi tiết tại [Benchmark-report.md](Benchmark-report.md))*

### 2.1.5. Bảo mật và kiểm soát truy cập

1. **Air-gapped**: Model chạy hoàn toàn offline, không cần Internet khi inference.
2. **Data-in-transit**: Mọi kết nối nội bộ sử dụng HTTPS/TLS.
3. **Phân quyền**: Mỗi người dùng chỉ được truy cập database được phân quyền. SQL thực thi đều ở chế độ READ-ONLY.
4. **Audit Log**: Ghi lại toàn bộ lịch sử truy vấn để phục vụ kiểm toán.
5. **Query Sanitization**: Chặn mọi câu SQL nguy hiểm (DROP, DELETE, UPDATE) — chỉ cho phép SELECT.

---

## 2.2. Thiết kế và phát triển ứng dụng

### 2.2.1. Phân tích yêu cầu chức năng

Ứng dụng được chia thành **4 module chức năng chính** và **1 module quản trị**:

#### Module 1: Truy vấn bằng ngôn ngữ tự nhiên (NLQ / Text-to-SQL)

Đây là module **nền tảng** — cung cấp khả năng truy xuất dữ liệu cho toàn bộ hệ thống.

- Người dùng nhập câu hỏi tiếng Việt (VD: *"Số lượng sinh viên theo khoa năm 2025"*).
- Agent Pipeline tự động chuyển đổi thành SQL, thực thi trên CSDL, và trả kết quả.
- Hỗ trợ nhiều loại CSDL (SQLite, MSSQL).

#### Module 2: Tự động hóa báo cáo

- Tổng hợp dữ liệu từ nhiều bảng/CSDL thành báo cáo hoàn chỉnh.
- Tự động tạo **thuyết minh bằng văn xuôi** — LLM diễn giải số liệu thành đoạn văn mạch lạc, dễ hiểu.
- Hỗ trợ báo cáo định kỳ (tháng, quý, năm) với template tùy chỉnh.
- Xuất báo cáo ra các định dạng: PDF, Word, Excel.

#### Module 3: Phân tích và phát hiện Insight

- LLM phân tích dữ liệu đã truy xuất để **nhận diện xu hướng** (tăng/giảm theo thời gian).
- Phát hiện **điểm bất thường** (anomaly) — VD: khoa có tỷ lệ bỏ học đột ngột tăng.
- Tìm **mối liên hệ ẩn** giữa các chỉ số — VD: mối tương quan giữa điểm đầu vào và tỷ lệ tốt nghiệp.
- Đề xuất các câu hỏi tiếp theo để khai thác sâu hơn.

#### Module 4: Trực quan hóa thông minh

- Tự động phân tích cấu trúc dữ liệu trả về (số lượng cột, kiểu dữ liệu, tính chất).
- **Đề xuất loại biểu đồ phù hợp**: Biểu đồ cột (so sánh), đường (xu hướng), tròn (tỷ lệ), v.v.
- Render biểu đồ trực tiếp trên giao diện web.
- Cho phép người dùng tùy chỉnh (đổi loại biểu đồ, màu sắc, tiêu đề).

#### Module 5: Quản trị hệ thống

- Quản lý tài khoản người dùng và phân quyền.
- Cấu hình kết nối CSDL.
- Giám sát hiệu năng (latency, error rate, GPU utilization).

### 2.2.2. Thiết kế kiến trúc ứng dụng

Kiến trúc **3 tầng** với Backend đóng vai trò điều phối trung tâm:

```
┌─────────────────────────────────────────────────────────┐
│         Tầng Trình bày (Presentation Layer)             │
│         Web UI (HTML/CSS/JavaScript)                    │
│         - Ô chat truy vấn NLQ                          │
│         - Khu vực hiển thị kết quả (bảng + biểu đồ)    │
│         - Trang báo cáo tự động                        │
│         - Dashboard insight                            │
│         - Trang quản trị                               │
└────────────────────────┬────────────────────────────────┘
                         │ REST API / WebSocket (streaming)
┌────────────────────────▼────────────────────────────────┐
│         Tầng Nghiệp vụ (Business Logic Layer)           │
│         Node.js + Express                               │
│                                                         │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────────┐ │
│  │ Text-to-SQL  │ │ Report Gen   │ │ Insight Engine   │ │
│  │ Agent        │ │ Module       │ │ Module           │ │
│  │ Pipeline     │ │              │ │                  │ │
│  └──────┬───────┘ └──────┬───────┘ └────────┬─────────┘ │
│         │                │                  │           │
│  ┌──────▼────────────────▼──────────────────▼─────────┐ │
│  │         SQL Execution Engine (READ-ONLY)           │ │
│  └────────────────────────────────────────────────────┘ │
└────────────────────────┬────────────────────────────────┘
                         │ OpenAI-Compatible API
┌────────────────────────▼────────────────────────────────┐
│         Tầng AI (AI Layer)                              │
│         Qwen3-8B INT8 (vLLM / Ollama)                   │
│         - SQL Generation & Reasoning                   │
│         - Report Narration                             │
│         - Data Insight Analysis                        │
│         - Chart Recommendation                         │
└─────────────────────────────────────────────────────────┘
```

> **Điểm mấu chốt**: Cùng một model Qwen3-8B phục vụ tất cả 4 module — mỗi module sử dụng **system prompt** và **tool set** khác nhau để hướng model vào nhiệm vụ cụ thể.

### 2.2.3. Thiết kế cơ sở dữ liệu quản lý

Ngoài các CSDL nghiệp vụ (đào tạo, nhân sự, v.v.), hệ thống có CSDL riêng để quản lý:

**Bảng `users`** — Tài khoản người dùng:

| Cột | Kiểu | Mô tả |
|-----|------|-------|
| id | INT PK | Mã người dùng |
| username | VARCHAR(50) | Tên đăng nhập |
| password_hash | VARCHAR(255) | Mật khẩu mã hóa |
| role | ENUM('admin','user') | Vai trò |

**Bảng `query_history`** — Lịch sử truy vấn:

| Cột | Kiểu | Mô tả |
|-----|------|-------|
| id | INT PK | Mã truy vấn |
| user_id | INT FK | Người thực hiện |
| question | TEXT | Câu hỏi gốc (NL) |
| generated_sql | TEXT | SQL được sinh ra |
| db_target | VARCHAR(100) | Database mục tiêu |
| module | ENUM('nlq','report','insight') | Module sử dụng |
| duration_ms | INT | Thời gian xử lý |

**Bảng `reports`** — Báo cáo đã tạo:

| Cột | Kiểu | Mô tả |
|-----|------|-------|
| id | INT PK | Mã báo cáo |
| user_id | INT FK | Người tạo |
| title | VARCHAR(200) | Tiêu đề báo cáo |
| content | TEXT | Nội dung báo cáo (Markdown) |
| period | VARCHAR(50) | Kỳ báo cáo (T1/2026, Q1/2026) |
| type | ENUM('monthly','quarterly','yearly','custom') | Loại |

**Bảng `db_connections`** — Cấu hình CSDL:

| Cột | Kiểu | Mô tả |
|-----|------|-------|
| id | INT PK | Mã kết nối |
| name | VARCHAR(100) | Tên hiển thị |
| type | ENUM('sqlite','mssql') | Loại CSDL |
| connection_string | TEXT | Chuỗi kết nối (mã hóa) |

### 2.2.4. Phát triển các module chức năng

#### Module Text-to-SQL (Agent Pipeline)

Sử dụng kiến trúc **Graph-based Agent** với các node:

| Node | Chức năng | Tools |
|------|----------|-------|
| **Coordinator** | Phân tích ý định, điều phối luồng | — |
| **SchemaAnalyst** | Khám phá schema liên quan | `get_tables()`, `get_columns()`, `get_sample_data()` |
| **SQLGenerator** | Sinh câu SQL | — |
| **SQLRefiner** | Kiểm tra và sửa lỗi | `execute_sql()` (để validate) |

#### Module Báo cáo tự động

Luồng hoạt động:
1. Người dùng chọn kỳ báo cáo và các chỉ tiêu cần thống kê.
2. Hệ thống gọi Module Text-to-SQL nội bộ để truy xuất từng chỉ tiêu.
3. LLM tổng hợp dữ liệu thành **đoạn thuyết minh bằng văn xuôi** — mạch lạc, có so sánh với kỳ trước.
4. Module Trực quan hóa tự động đính kèm biểu đồ phù hợp.
5. Xuất ra định dạng hoàn chỉnh (PDF/Word).

**Chiến lược xử lý dữ liệu theo quy mô kết quả:**

Do sử dụng model 8B (context window hạn chế), hệ thống áp dụng chiến lược phân nhánh dựa trên số lượng dòng kết quả:

```
SQL trả về kết quả
        │
        ▼
  ┌─────────────┐
  │ Số row ≤ 15 │──── CÓ ────▸ LLM đọc trực tiếp toàn bộ dữ liệu
  └─────────────┘              → Tổng hợp thành văn xuôi/báo cáo
        │
       KHÔNG
        │
        ▼
  LLM đọc metadata schema     ──▸ Gợi ý cho người dùng:
  (tên cột, kiểu dữ liệu,         "Dữ liệu có 1.200 dòng.
   số row, giá trị unique)          Bạn muốn thống kê theo:
                                    - Theo Khoa?
                                    - Theo Năm?
                                    - Theo Giới tính?"
                                        │
                                        ▼
                               Người dùng chọn tiêu chí
                                        │
                                        ▼
                               Text-to-SQL sinh GROUP BY
                               → Kết quả gọn → LLM đọc được
```

> **Lý do không tự động GROUP BY**: Model 8B dễ hiểu sai ý định người dùng khi tự ý quyết định nhóm theo tiêu chí nào. Thay vào đó, hệ thống **gợi ý các chiều thống kê** dựa trên metadata (các cột có cardinality thấp = phù hợp GROUP BY) để người dùng lựa chọn. Điều này đảm bảo kết quả đúng ý định và tránh lỗi hallucination.

#### Module Insight

- Sau khi có dữ liệu đã gọn (qua bước trên), LLM được prompt để:
  - Phát hiện **xu hướng** (tăng/giảm qua các kỳ).
  - Tìm **anomaly** (giá trị bất thường so với trung bình).
  - Gợi ý **câu hỏi drill-down** để người dùng khai thác tiếp.
- Dữ liệu được serialize thành markdown table hoặc JSON rồi nhét vào prompt — LLM "đọc" dữ liệu dạng text và sinh nhận xét.

#### Module Trực quan hóa

- LLM phân tích metadata của kết quả (số cột, kiểu dữ liệu, cardinality) và đề xuất loại chart phù hợp.
- Frontend render biểu đồ bằng thư viện JavaScript (Chart.js hoặc tương đương).
- Nếu kết quả chỉ có 1-2 giá trị → hiển thị dạng thẻ số (KPI card) thay vì biểu đồ.

### 2.2.5. Xây dựng giao diện người dùng (UI/UX)

#### Nguyên tắc thiết kế
- **Dùng ngay, không cần đào tạo**: Giao diện chat-style quen thuộc, người dùng chỉ cần gõ câu hỏi tiếng Việt.
- **Real-time streaming**: Hiển thị quá trình suy luận của Agent theo thời gian thực qua WebSocket.
- **Responsive**: Hoạt động tốt trên desktop và tablet.

#### Các màn hình chính

1. **Màn hình Truy vấn (Chat)**: Ô nhập câu hỏi, khu vực hiển thị kết quả (bảng + biểu đồ), nút xem SQL đã sinh.
2. **Màn hình Báo cáo**: Chọn kỳ, chọn chỉ tiêu → Tạo báo cáo tự động → Xuất file.
3. **Màn hình Dashboard**: Tổng hợp insight, biểu đồ xu hướng, cảnh báo bất thường.
4. **Màn hình Quản trị**: Quản lý CSDL, tài khoản, giám sát hiệu năng.

### 2.2.6. Tích hợp hệ thống

Các bước tích hợp theo thứ tự:

1. **Model Serving ↔ Backend**: Kết nối với vLLM/Ollama qua API OpenAI-Compatible. Kiểm tra streaming, timeout, error handling.
2. **Agent Pipeline ↔ CSDL**: Cấu hình tool calling để Agent truy vấn schema và thực thi SQL trên CSDL thực.
3. **Module Báo cáo ↔ Text-to-SQL**: Module báo cáo gọi nội bộ Text-to-SQL Agent để truy xuất từng chỉ tiêu.
4. **Frontend ↔ Backend**: WebSocket (Socket.IO) cho streaming kết quả real-time.
5. **End-to-End**: Kiểm tra toàn bộ luồng từ câu hỏi → SQL → Kết quả → Biểu đồ → Báo cáo.

### 2.2.7. Kiểm thử và đảm bảo chất lượng

#### Benchmark Text-to-SQL trên bộ ViText2SQL

Module Text-to-SQL được đánh giá trên bộ **ViText2SQL** gồm 1499 câu truy vấn tiếng Việt, phân loại 4 mức độ khó, sử dụng phương pháp **AI Judge** (LLM-as-a-Judge) để chấm điểm semantic equivalence.

*(Chi tiết đầy đủ: [Benchmark-report.md](Benchmark-report.md))*

**Tóm tắt kết quả:**

| Chỉ số | Qwen3-8B INT8 (Agent) | DeepSeek-V3 658B (Baseline) |
|--------|-----------------------|-----------------------------|
| **Accuracy (Score ≥ 95)** | **58.44%** (876/1499) | **63.31%** (949/1499) |
| **Điểm trung bình** | 77.43 | 81.21 |
| **Hiệu năng so với Baseline** | **~92%** | 100% |
| **Ước tính Execution Match** | ~69-72% | ~72-75% |
| **Latency trung bình** | ~65s | ~2s |

| Mức độ khó | Qwen3-8B (Agent) | DeepSeek-V3 (API) | Chênh lệch |
|------------|------------------|-------------------|------------|
| Easy | 65.32% | 69.22% | +3.90% |
| Medium | 53.70% | 58.56% | +4.86% |
| Hard | 47.46% | 55.93% | +8.47% |
| Extra Hard | 40.00% | 20.00% | -20.00% |

> **Kết luận benchmark**: Qwen3-8B Agent đạt ~92% hiệu năng so với model 658B. Đặc biệt, ở mức Extra Hard, Agent vượt DeepSeek nhờ suy luận nhiều bước. Phân tích sâu cho thấy accuracy thực tế (nếu dùng Execution Match) có thể đạt **69-72%**.

#### Kiểm thử chức năng các module khác

| Module | Phương pháp kiểm thử | Tiêu chí đạt |
|--------|----------------------|--------------|
| Báo cáo tự động | Tạo 10 báo cáo mẫu, so sánh với báo cáo thủ công | Nội dung chính xác ≥ 90% |
| Insight | Kiểm tra trên 5 bộ dữ liệu có anomaly đã biết | Phát hiện ≥ 80% anomaly |
| Trực quan hóa | Kiểm tra đề xuất chart trên 20 kết quả khác nhau | Đề xuất phù hợp ≥ 85% |

---

# CHƯƠNG 3: TRIỂN KHAI THỬ NGHIỆM TẠI HỌC VIỆN AN NINH NHÂN DÂN

## 3.1. Chuẩn bị triển khai

### 3.1.1. Xác định đơn vị thí điểm

Thí điểm tại **Phòng Đào tạo** — đơn vị có nhu cầu thống kê, báo cáo thường xuyên từ CSDL quản lý sinh viên, điểm thi, và kế hoạch đào tạo.

**Tiêu chí:**
- Có CSDL đã số hóa và cấu trúc hóa.
- Nhu cầu truy vấn/báo cáo hàng ngày/tuần.
- Nhân sự sẵn sàng tham gia thử nghiệm.

### 3.1.2. Chuẩn bị hạ tầng kỹ thuật

- [ ] Cài đặt GPU Server (Qwen3-8B INT8 + vLLM/Ollama).
- [ ] Triển khai Backend API (Node.js) trên server nội bộ.
- [ ] Cấu hình mạng: Firewall, HTTPS certificate.
- [ ] Kết nối CSDL mục tiêu (quyền READ-ONLY).
- [ ] Thiết lập monitoring (GPU, latency, error rate).

### 3.1.3. Chuẩn bị dữ liệu

- Tạo tài liệu mô tả schema CSDL mục tiêu bằng tiếng Việt.
- Chuẩn bị tập 20-30 câu hỏi mẫu theo nghiệp vụ thực tế.
- Viết Gold SQL cho tập mẫu để đánh giá accuracy trên dữ liệu thực.

### 3.1.4. Đào tạo người dùng

Đào tạo 1 buổi (~2 giờ): Giới thiệu hệ thống → Hướng dẫn sử dụng (cách đặt câu hỏi, xem báo cáo, đọc biểu đồ) → Thực hành → Q&A.

Tài liệu hỗ trợ: Sổ tay sử dụng, video hướng dẫn, danh sách câu hỏi mẫu.

---

## 3.2. Thực hiện triển khai thử nghiệm

### 3.2.1. Kế hoạch triển khai

| Giai đoạn | Thời gian | Nội dung | Mục tiêu |
|-----------|-----------|----------|----------|
| **GĐ 1** | Tuần 1 | Cài đặt hạ tầng, kết nối CSDL | Hệ thống chạy ổn định |
| **GĐ 2** | Tuần 2 | Nhóm kỹ thuật test toàn bộ | Bug-free, latency < 60s |
| **GĐ 3** | Tuần 3-4 | Người dùng thí điểm sử dụng thực tế | Thu thập phản hồi |
| **GĐ 4** | Tuần 5 | Đánh giá, sửa lỗi, tối ưu | Báo cáo đánh giá hoàn chỉnh |

### 3.2.2. Giám sát trong quá trình triển khai

Các chỉ số giám sát: GPU Utilization, Latency (P50/P95), Error Rate, Query Count/ngày, Accuracy (kiểm tra ngẫu nhiên 10% câu truy vấn hàng tuần).

### 3.2.3. Thu thập phản hồi

- **Log tự động**: Ghi toàn bộ câu hỏi, SQL, kết quả, thời gian.
- **Khảo sát**: Bảng hỏi Likert 5 câu sau mỗi phiên sử dụng.
- **Phỏng vấn**: 3-5 người dùng chính sau giai đoạn thử nghiệm.

---

## 3.3. Đánh giá kết quả

### 3.3.1. Đánh giá kỹ thuật

| Chỉ số | Mục tiêu |
|--------|----------|
| Accuracy (NLQ) trên dữ liệu thực | ≥ 55% |
| Latency trung bình | < 30s |
| Uptime | ≥ 99% |
| Error Rate | < 5% |
| Chất lượng báo cáo tự động | Chính xác ≥ 90% |

### 3.3.2. Đánh giá nghiệp vụ

- Thời gian tiết kiệm so với phương pháp truyền thống (viết SQL thủ công / nhờ IT).
- Tỷ lệ câu hỏi nghiệp vụ mà hệ thống trả lời được.
- Chất lượng báo cáo tự động so với báo cáo viết tay.

### 3.3.3. Mức độ chấp nhận của người dùng

Khảo sát Likert (1-5): Dễ sử dụng, kết quả chính xác, thời gian chấp nhận được, sẵn sàng dùng thường xuyên, giúp làm việc hiệu quả hơn. **Mục tiêu ≥ 3.5/5.0**.

### 3.3.4. Phân tích chi phí - lợi ích

| Hạng mục | Chi phí |
|----------|---------|
| GPU Server (1 lần) | ~30-50 triệu VNĐ |
| Phát triển phần mềm | Nhân lực nội bộ |
| Vận hành/tháng | ~500K-1M VNĐ |
| **Tổng Year-1** | **~35-55 triệu VNĐ** |

**So sánh**: Thuê API nước ngoài ~60-150 triệu/năm (và vi phạm bảo mật). Thuê IT viết SQL ~180-240 triệu/năm. → **Hoàn vốn < 6 tháng**.

---

## 3.4. Hoàn thiện và đề xuất nhân rộng

### 3.4.1. Cải tiến dựa trên kết quả thử nghiệm

1. **Giảm Latency**: Tối ưu Agent Pipeline cho câu hỏi đơn giản (mục tiêu < 15s).
2. **Giảm lỗi Null**: Cải thiện cơ chế retry/timeout (mục tiêu error < 5%).
3. **Cải thiện UI**: Gợi ý câu hỏi, giải thích SQL bằng tiếng Việt.
4. **Mở rộng module Báo cáo**: Thêm template báo cáo theo yêu cầu thực tế.

### 3.4.2. Kế hoạch nhân rộng

- **6 tháng đầu**: Mở rộng sang 2-3 đơn vị khác trong Học viện.
- **6-12 tháng**: Tích hợp thêm CSDL nghiệp vụ (nhân sự, tài chính).
- **12-24 tháng**: Xem xét triển khai tại các đơn vị ngoài Học viện.

### 3.4.3. Định hướng phát triển

1. **Nâng cấp Model**: Thử nghiệm Qwen3-14B/32B khi có phần cứng mạnh hơn.
2. **Execution Match**: Chấm điểm bằng kết quả thực thi SQL thay vì so sánh text.
3. **Fine-tuning nhẹ**: Khi đã có đủ dữ liệu thực tế, fine-tune LoRA cho schema cụ thể của Học viện.
4. **Multi-modal**: Hỗ trợ input ảnh (chụp biểu mẫu → sinh báo cáo).

---

## 3.5. Tổng kết

### 3.5.1. Thành công đạt được

- **Chứng minh tính khả thi**: Model 8B chạy local đạt ~92% hiệu năng model 658B, đảm bảo bảo mật hoàn toàn.
- **Agent Pipeline hiệu quả**: Bù đắp hạn chế model nhỏ mà không cần fine-tuning tốn kém.
- **Hệ thống toàn diện**: Không chỉ truy vấn dữ liệu mà còn tự động hóa báo cáo, phát hiện insight, trực quan hóa.
- **Chi phí thấp**: Chỉ bằng ~1/4 giải pháp API bên ngoài.

### 3.5.2. Khó khăn và thách thức

- **Latency**: ~65s là rào cản cho trải nghiệm người dùng.
- **Lỗi hệ thống**: 26% null ở Agent Pipeline cần giải quyết.
- **Chất lượng Dataset**: ViText2SQL còn lỗi Gold SQL, ảnh hưởng đánh giá.
- **Phần cứng**: A4000 16GB chỉ vừa đủ chạy model 8B.

### 3.5.3. Bài học kinh nghiệm

1. **Không cần model lớn nhất** — Agent Pipeline + model nhỏ hoàn toàn khả thi cho bài toán cụ thể.
2. **Chất lượng dữ liệu > Kích thước model** — Lỗi Gold SQL ảnh hưởng accuracy nhiều hơn việc tăng model size.
3. **On-premise là khả thi** — Model mã nguồn mở + GPU trung cấp đủ để triển khai LLM nội bộ.
4. **Thiết kế module** — Xây dựng Text-to-SQL làm nền tảng giúp mở rộng linh hoạt sang báo cáo, insight, trực quan hóa.

---

*Cập nhật: 24/02/2026*
