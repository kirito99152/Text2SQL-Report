# Báo cáo Kết quả Benchmark Text-to-SQL

## 1. Tổng quan & Phương pháp

### Mục tiêu
Benchmark nội bộ (Internal bench) nhằm đánh giá khả năng của các mô hình trong kịch bản **low-resource** và **tiếng Việt**, hướng tới thử nghiệm cho production.

### Thách thức
1. **Low-resource**: Giới hạn về tài nguyên tính toán (GPU memory, chi phí vận hành).
2. **Thiếu model chuyên biệt**: Chưa có nhiều model Text-to-SQL mạnh mẽ hỗ trợ tốt tiếng Việt.

### Giải pháp: Agent Pipeline
Để giải quyết hai khó khăn trên, chúng tôi áp dụng phương pháp **Agent Pipeline** kết hợp với **General Purpose Model** (Qwen3-8B INT8).
- Thay vì finetune một model lớn (tốn kém) hoặc dùng model API (vấn đề chi phí/bảo mật), chúng tôi sử dụng model 8B chạy local.
- Bù đắp sự thiếu hụt tri thức chuyên sâu bằng quy trình agent nhiều bước (Reasoning -> Generation -> Refinement).

### Cấu hình Hệ thống
1. **Qwen3-8B INT8 (Agent Pipeline)**
   - **Environment**: Local Server
   - **GPU**: NVIDIA A4000
   - **CPU**: 4 vCPU
   - **RAM**: 21GB
   - **Phương pháp**: Agent Pipeline (Multi-step reasoning)

2. **DeepSeek-V3 658B (Single-shot via API)**
   - **Environment**: API Call
   - **Model Size**: ~658B Params (MoE)
   - **Phương pháp**: Single-shot Inference

### Dataset & Đánh giá
- **Dataset**: `ViText2SQL` (Mức độ âm tiết).
  - *Lưu ý*: Dataset hiện tại vẫn còn tồn tại một vài lỗi logic và chưa hoàn toàn tối ưu. Cần có kế hoạch rà soát và cải thiện chất lượng dữ liệu trong tương lai để kết quả benchmark chính xác hơn.
- **Metric**: AI Judge Evaluation (LLM-as-a-Judge).
  - Do chưa có đầy đủ dữ liệu database thực tế để thực hiện **Execution Match** (chạy câu lệnh SQL để so sánh kết quả), chúng tôi sử dụng mô hình ngôn ngữ (AI) để chấm điểm.
  - AI Judge sẽ phân tích và so sánh sự tương đồng về ngữ nghĩa (semantic equivalence) giữa câu SQL được sinh ra và câu SQL chuẩn (Gold Label). Phương pháp này giúp đánh giá chính xác hơn so với so sánh chuỗi đơn thuần, đặc biệt khi có nhiều cách viết SQL khác nhau cho cùng một bài toán.

---

## 2. Kết quả Thống kê

| Chỉ số | Qwen3-8B INT8 (Agent) | DeepSeek-V3 658B (API) |
|--------|-----------------------|------------------------|
| **Tổng mẫu (Samples)** | 1499 | 1499 |
| **Strict Accuracy** | **58.44%** (876/1499) | **62.37%** (935/1499) |
| **Thời gian trung bình** | ~64.78s | ~2.09s |
| **Điểm trung bình (Score)** | 77.43 | 81.01 |
| **Số lỗi (Errors)** | 48 | 0 |

---

## 3. Phân tích

### 3.1. Hiệu năng & Chất lượng (Accuracy)
- **DeepSeek-V3** (658B) đạt độ chính xác cao hơn (**62.37%** vs 58.44%), khẳng định sức mạnh của các model khổng lồ (Large Language Models) so với model nhỏ 8B.
- Tuy nhiên, **Qwen3-8B INT8** với Agent Pipeline bám đuổi khá sát (chênh lệch ~4%), cho thấy tiềm năng lớn của phương pháp Agentic Workflow. Model 8B thông thường khó đạt được mức này nếu chỉ dùng single-shot.

### 3.2. Tốc độ & Tài nguyên
- **Latency**: DeepSeek nhanh hơn vượt trội (~2s so với ~65s của Agent).
  - Agent Pipeline tốn thời gian cho nhiều bước suy luận và tự sửa lỗi (Self-correction).
- **Resource**:
  - Qwen3-8B chạy mượt mà trên **1 GPU A4000** (cấu hình tầm trung/thấp), phù hợp deploy on-premise hoặc edge server.
  - DeepSeek đòi hỏi cluster lớn hoặc lệ thuộc API.

### 3.3. Kết luận
- **Production Scenario**: Nếu cần real-time thấp (<5s), DeepSeek hoặc model lớn qua API là bắt buộc.
- **Low-resource / On-premise**: Với cấu hình giới hạn, **Qwen3-8B Agent** là giải pháp khả thi, đánh đổi thời gian phản hồi (latency) lấy sự tự chủ về hạ tầng và chi phí thấp, trong khi vẫn duy trì độ chính xác chấp nhận được (gần 60%).

---

*Cập nhật: 19/02/2026*
