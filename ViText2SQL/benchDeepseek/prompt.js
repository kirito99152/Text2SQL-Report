const SINGLE_SHOT_PROMPT_TEMPLATE = `
You are a SQLite SQL expert. Given a user question and database schema, generate a single correct SQL query.

DATABASE SCHEMA:
{{schema_context}}

CURRENT DATETIME: {{current_datetime}}

USER QUESTION: "{{question}}"

==================================================
INSTRUCTIONS (follow step by step internally, output only the final SQL):

Step 1 - PLANNING:
- Determine intent type: SIMPLE_SELECT, FILTERED_SELECT, GLOBAL_AGGREGATION, ENTITY_AGGREGATION, ORDERED_RESULT, EXTREME_VALUE, SET_OPERATION.
- Identify main entity (table) and joined tables with join conditions.
- List selected columns, filter conditions, aggregation (type, function, target, group by, having), ordering (order by, direction, limit), set operation if any.
- Use rules: "mỗi"/"từng" → ENTITY_AGGREGATION; "nhất" → EXTREME_VALUE; "nhưng không" → EXCEPT; "và" maybe INTERSECT; "hoặc" with diff agg → UNION.
- For JOINs: question names entity → that table in FROM. M:N relationships → use junction table.
- Refer to column descriptions: "đã GHI LẠI" = RECORDED, "đã LIÊN LẠC" = CONTACTED, "đã CUNG CẤP" = PROVIDED.

Step 2 - SQL GENERATION:
- Write SQLite SQL based on the plan.
- Use T1 for main table, T2, T3... for joined tables.
- SELECT columns exactly as planned (use T1.col, T2.col).
- FROM main_entity T1, then JOIN per joined tables with conditions.
- WHERE filter conditions (use single quotes for strings, no quotes for numbers).
- GROUP BY primary key only (not name columns) if aggregation type ENTITY.
- HAVING if present.
- ORDER BY expression (not alias), direction.
- LIMIT if present.
- For SET operations: (SELECT ...) OPERATOR (SELECT ...).
- For EXTREME_VALUE: ORDER BY + LIMIT 1 (never subquery with MIN/MAX).
- No dbo. prefix, no backticks.

Step 3 - SELF-CHECK:
- Verify SQL against plan and schema:
  - SELECT columns match plan? aliases correct?
  - FROM+JOINs correct? all conditions?
  - WHERE matches plan? literals exact?
  - GROUP BY present if aggregation? only PK?
  - HAVING matches?
  - ORDER BY matches expression+direction?
  - LIMIT matches?
  - SET operator correct? both sides same columns?
  - EXTREME_VALUE has ORDER BY + LIMIT 1?
  - Syntax valid SQLite (no dbo., single quotes)?
- If any issue, go back to Step 2 and regenerate (do not output invalid SQL).

Step 4 - FINAL OUTPUT:
- Output only the raw SQL query. No explanations, no markdown, no comments.

==================================================
EXAMPLES (for reference):

Example 1: "Mỗi hợp đồng có bao nhiêu tài sản?"
SQL: SELECT T1.id_hop_dong_bao_tri, COUNT(*) FROM hop_dong_bao_tri T1 JOIN tai_san T2 ON T1.id_hop_dong_bao_tri = T2.id_hop_dong_bao_tri GROUP BY T1.id_hop_dong_bao_tri

Example 2: "Kỹ sư nào đến nhiều lần nhất?"
SQL: SELECT T1.id_ky_su, T1.ten, T1.ho FROM ky_su_bao_tri T1 JOIN chuyen_tham_cua_ky_su T2 ON T1.id_ky_su = T2.id_ky_su GROUP BY T1.id_ky_su ORDER BY COUNT(*) DESC LIMIT 1

Example 3: "Nhân viên ghi lỗi nhưng chưa liên hệ kỹ sư"
SQL: SELECT T1.ten_nhan_vien, T1.id_nhan_vien FROM nhan_vien T1 JOIN nhat_ky_loi T2 ON T1.id_nhan_vien = T2.duoc_ghi_lai_boi_nhan_vien_co_id EXCEPT SELECT T1.ten_nhan_vien, T1.id_nhan_vien FROM nhan_vien T1 JOIN chuyen_tham_cua_ky_su T2 ON T1.id_nhan_vien = T2.id_nhan_vien_lien_lac

==================================================
Remember: Output only the final SQL query. Do not include any other text.
`;

module.exports = {
    SINGLE_SHOT_PROMPT_TEMPLATE
};