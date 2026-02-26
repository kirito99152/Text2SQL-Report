# A Pilot Study of Text-to-SQL Semantic Parsing for Vietnamese

**Anh Tuan Nguyen, Mai Hoang Dao, Dat Quoc Nguyen**
NVIDIA, USA; VinAI Research, Vietnam

## Abstract

Semantic parsing là một tác vụ NLP quan trọng. Tuy nhiên, tiếng Việt là ngôn ngữ tài nguyên thấp trong lĩnh vực này. Trong bài báo này, chúng tôi giới thiệu **bộ dữ liệu Text-to-SQL quy mô lớn công khai đầu tiên cho tiếng Việt**.

Chúng tôi mở rộng và đánh giá hai baseline mạnh:

* EditSQL (Zhang et al., 2019)
* IRNet (Guo et al., 2019)

Các phát hiện chính:

1. Word segmentation cải thiện kết quả.
2. NPMI hữu ích cho schema linking.
3. Latent syntactic features từ dependency parser giúp tăng hiệu năng.
4. PhoBERT vượt XLM-R trong thiết lập tiếng Việt.

---

# 1. Introduction

Semantic parsing chuyển câu hỏi tự nhiên thành biểu diễn ý nghĩa (ví dụ SQL).

Các dataset lớn:

* WikiSQL
* Spider

Spider khó hơn WikiSQL vì:

* Câu hỏi phức tạp
* Generalize sang database chưa thấy trước

Khó khăn với tiếng Việt:

* 85% từ gồm ≥ 2 âm tiết
* Dấu cách vừa phân tách từ vừa phân tách âm tiết

Ví dụ:

"Có bao nhiêu quốc gia ở châu Âu"

8 syllables → 5 words:

Có | bao_nhiêu | quốc_gia | ở | châu_Âu

Do đó cần nghiên cứu:

* Syllable-level
* Word-level

---

# 2. Our Dataset

Tác giả:

* Dịch toàn bộ Spider sang tiếng Việt
* Bao gồm:

  * Question
  * Schema (table, column, values)

Tổng số câu dịch được:

* 9691 questions
* 5263 SQL
* 166 databases

## Dataset split

| Split | Questions | SQL  | DB |
| ----- | --------- | ---- | -- |
| Train | 6831      | 3493 | 99 |
| Dev   | 954       | 589  | 25 |
| Test  | 1906      | 1193 | 42 |

Không có database overlap giữa các split.

---

## Ví dụ

### Easy

Original:
What is the number of cars with more than 4 cylinders?

SQL:
SELECT count(*) FROM CARS_DATA WHERE Cylinders > 4

Translated:
Cho biết số lượng những chiếc xe có nhiều hơn 4 xi lanh.

---

### Hard (nested query)

Original:
Which countries in europe have at least 3 car manufacturers?

Translated:
Những quốc gia nào ở châu Âu có ít nhất 3 nhà sản xuất xe hơi?

---

Word segmentation sử dụng:

* RDRSegmenter từ VnCoreNLP

Dataset public tại:
[https://github.com/VinAIResearch/ViText2SQL](https://github.com/VinAIResearch/ViText2SQL)

---

# 3. Baseline Models

Hai baseline:

## EditSQL

* BiLSTM encoder
* Interaction encoder
* LSTM decoder

## IRNet

* Schema linking
* Sinh SemQL
* Chuyển sang SQL

---

# Extensions

## 1. NPMI cho schema linking

Vì ConceptNet không có tiếng Việt → dùng:

Normalized Pointwise Mutual Information (NPMI)

Để match:
cell value ↔ column name

---

## 2. Latent syntactic features

Dùng jPTDP dependency parser

Trích latent embedding từ BiLSTM

---

## 3. Pre-trained Language Models

* XLM-R-base
* PhoBERT-base

PhoBERT pretrain trên 20GB word-level Vietnamese

---

# 4. Experiments

## Evaluation metrics

* Exact match accuracy
* Component matching F1

---

## Main results

### Word-level > Syllable-level

Ví dụ IRNet:

* Syllable: 38.2%
* Word: 43.6%

→ Word segmentation giúp ~5% absolute

---

### Human translation > Machine translation

IRNet:

* Machine: 21.6%
* Human: 43.6%

→ +22% absolute

---

### Latent syntactic features

EditSQL:
30.2% → 42.2%

IRNet:
43.6% → 47.1%

---

### Pretrained models

PhoBERT > XLM-R

IRNet:

* XLM-R: 52.8%
* PhoBERT: 53.2%

---

## Hardness breakdown

Performance giảm mạnh ở:

* Hard
* Extra Hard

WHERE clause hưởng lợi nhiều nhất từ LM.

---

## NPMI ablation

Không dùng NPMI:

→ IRNet giảm hơn 6% absolute

---

# Error Analysis

Tổng 382 lỗi trên dev:

* 32%: sai column name
* 22%: nested query
* 18%: sai operator (max/min)
* 16%: sai table name
* 12%: SQL khác syntax nhưng đúng execution

---

# 5. Conclusion

Đóng góp chính:

1. Dataset Text-to-SQL tiếng Việt công khai đầu tiên
2. Word segmentation quan trọng
3. NPMI giúp schema linking
4. PhoBERT hiệu quả nhất

