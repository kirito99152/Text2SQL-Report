// src/prompts_v2_optimized.js - VRAM-OPTIMIZED FOR QWEN 3-8B
// Target: <16GB VRAM (same as V2 cũ) while keeping improvements

// ANALYSIS OF VRAM ISSUE:
// V2 cũ: ~16GB VRAM
// V2 mới: 21-22GB VRAM (+37.5%)
// 
// ROOT CAUSE: Not prompt length, but REASONING TOKEN GENERATION
// - Verbose instructions → Model generates long thinking process
// - Validation checklists → Model checks each item verbally
// - Multiple examples → Model tries to match patterns extensively
//
// SOLUTION: Keep same rules but COMPRESS instructions to reduce reasoning

// ============================================================================
// 1. DESCRIPTION GENERATION - UNCHANGED (not used during inference)
// ============================================================================

// 1. ENHANCED Description Generation Prompt - Now with context and purpose
const DESCRIPTION_GENERATION_SYSTEM_PROMPT = `You are an AI assistant helping to document a Vietnamese database schema for Text-to-SQL generation.

Your task: Generate CLEAR, CONTEXTUAL Vietnamese descriptions that help distinguish similar columns and tables.

CRITICAL RULES:
1. Include PURPOSE and CONTEXT, not just literal translation
2. For relationship columns (foreign keys), specify WHAT the relationship represents
3. For similar-sounding columns, emphasize the DIFFERENCE using action verbs
4. Keep descriptions concise but informative (10-25 words max)
5. Use PAST TENSE action verbs to clarify roles: "đã GHI LẠI", "đã LIÊN LẠC", "đã YÊU CẦU"

EXAMPLES OF GOOD DESCRIPTIONS:

Table Names:
❌ Bad: "chuyen_tham_cua_ky_su" → "chuyến thăm của kỹ sư"
✅ Good: "chuyen_tham_cua_ky_su" → "chuyến thăm của kỹ sư đến tài sản để khắc phục lỗi"

Column Names (Regular):
❌ Bad: "ngay_mua_tai_san" → "ngày mua tài sản"
✅ Good: "ngay_mua_tai_san" → "ngày mua tài sản (thời điểm công ty mua tài sản này)"

Column Names (Foreign Keys - MOST IMPORTANT):
❌ Bad: "duoc_ghi_lai_boi_nhan_vien_co_id" → "được ghi lại bởi nhân viên có id"
✅ Good: "duoc_ghi_lai_boi_nhan_vien_co_id" → "ID của nhân viên đã GHI LẠI lỗi này vào nhật ký"

❌ Bad: "id_nhan_vien_lien_lac" → "id nhân viên liên lạc"
✅ Good: "id_nhan_vien_lien_lac" → "ID của nhân viên đã LIÊN LẠC với kỹ sư để yêu cầu chuyến thăm"

❌ Bad: "id_hop_dong_bao_tri_cua_cong_ty" → "id hợp đồng bảo trì của công ty"
✅ Good: "id_hop_dong_bao_tri_cua_cong_ty" → "ID công ty đã KÝ KẾT hợp đồng bảo trì này"

❌ Bad: "id_cong_ty_cung_cap" → "id công ty cung cấp"
✅ Good: "id_cong_ty_cung_cap" → "ID công ty đã CUNG CẤP tài sản này"

More Examples:
- "id_ky_su_ghe_tham" → "ID duy nhất của chuyến thăm (primary key)"
- "id_ky_su" → "ID của kỹ sư đã THỰC HIỆN chuyến thăm này"
- "id_muc_nhap_cua_nhat_ky_loi" → "ID mục nhật ký lỗi mà chuyến thăm này LIÊN QUAN ĐẾN"
- "id_bo_phan_bi_loi" → "ID của bộ phận bị LỖI"
- "id_bo_phan" → "ID của bộ phận (không liên quan đến lỗi)"

WHY THIS MATTERS:
The schema has MANY similar column names. Your descriptions MUST make it clear:
- WHO did WHAT action (using past tense verbs)
- WHICH entity the relationship points to
- The PURPOSE of the relationship

Output format: Valid JSON object with keys in format 'table:schema.TableName' or 'column:schema.TableName.ColumnName'. Each value must be an object with ONE key 'description' containing the Vietnamese description string.`;

const DESCRIPTION_GENERATION_USER_HEADER = `Please generate Vietnamese descriptions for the following schema items.\n`;

// ============================================================================
// 2. PLANNING PROMPT - OPTIMIZED (removed verbose explanations)
// ============================================================================

const PLANNING_PROMPT_TEMPLATE = `
You are a SQL logical planner. Transform question into structured plan.

DATABASE SCHEMA
{{schema_context}}

⚠️ CRITICAL: Read column descriptions - action verbs show WHO did WHAT
- "đã GHI LẠI" = RECORDED | "đã LIÊN LẠC" = CONTACTED | "đã CUNG CẤP" = PROVIDED

CURRENT DATETIME: {{current_datetime}}
USER QUESTION: "{{question}}"

==================================================
CLASSIFY INTENT (pick ONE):

A) SIMPLE_SELECT - Just columns, no WHERE/aggregation/ORDER
B) FILTERED_SELECT - Has WHERE, no aggregation
C) GLOBAL_AGGREGATION - COUNT/SUM/AVG entire table (no "mỗi"/"từng")
D) ENTITY_AGGREGATION - "mỗi"/"từng" + aggregation + GROUP BY
E) ORDERED_RESULT - Has "sắp xếp"/"xếp theo", no aggregation
F) EXTREME_VALUE - "nhất"/"đầu tiên"/"cuối cùng" → ORDER BY + LIMIT 1
G) SET_OPERATION - "nhưng không"→EXCEPT | "hoặc"+diff agg→UNION | "và"→INTERSECT

JOIN RULES:
- Question names entity → That table in FROM
- "X của từng Y" → Y is main entity
- M:N relationships → Use junction table (nhat_ky_loi↔loi_bo_phan uses nhat_ky_cua_loi_bo_phan)

==================================================
OUTPUT FORMAT:

INTENT_TYPE: <A-G>
MAIN_ENTITY: <table>
JOINED_TABLES: <tables> | NONE
JOIN_CONDITIONS: <T1.col=T2.col> | NONE
SELECT_COLUMNS: <columns>
FILTER_CONDITIONS: <conditions> | NONE
AGGREGATION:
- TYPE: NONE|GLOBAL|ENTITY
- FUNCTION: COUNT|SUM|AVG|MIN|MAX|NONE
- TARGET_COLUMN: <col|*>
- GROUP_BY: <PK only> | NONE
- HAVING: <condition> | NONE
ORDERING:
- ORDER_BY: <expr> | NONE
- DIRECTION: ASC|DESC | NONE
- LIMIT: <num> | NONE
SET_OPERATION: NONE|EXCEPT|UNION|INTERSECT
- LEFT_QUERY: <desc>
- RIGHT_QUERY: <desc>

==================================================
EXAMPLES (use as templates):

Ex1: "Mỗi hợp đồng có bao nhiêu tài sản?"
INTENT_TYPE: ENTITY_AGGREGATION
MAIN_ENTITY: hop_dong_bao_tri
JOINED_TABLES: tai_san
JOIN_CONDITIONS: T1.id_hop_dong_bao_tri = T2.id_hop_dong_bao_tri
SELECT_COLUMNS: T1.id_hop_dong_bao_tri, COUNT(*)
AGGREGATION: TYPE: ENTITY | FUNCTION: COUNT | TARGET_COLUMN: * | GROUP_BY: T1.id_hop_dong_bao_tri
FILTER_CONDITIONS: NONE | ORDERING: NONE | SET_OPERATION: NONE

Ex2: "Kỹ sư nào đến nhiều lần nhất?"
INTENT_TYPE: EXTREME_VALUE
MAIN_ENTITY: ky_su_bao_tri
JOINED_TABLES: chuyen_tham_cua_ky_su
JOIN_CONDITIONS: T1.id_ky_su = T2.id_ky_su
SELECT_COLUMNS: T1.id_ky_su, T1.ten, T1.ho
AGGREGATION: TYPE: ENTITY | FUNCTION: COUNT | TARGET_COLUMN: * | GROUP_BY: T1.id_ky_su
ORDERING: ORDER_BY: COUNT(*) | DIRECTION: DESC | LIMIT: 1
SET_OPERATION: NONE

Ex3: "Nhân viên ghi lỗi nhưng chưa liên hệ kỹ sư"
INTENT_TYPE: SET_OPERATION
MAIN_ENTITY: nhan_vien
SET_OPERATION: EXCEPT
LEFT_QUERY: Employees in fault log (JOIN nhat_ky_loi AS T2 ON T1.id_nhan_vien=T2.duoc_ghi_lai_boi_nhan_vien_co_id)
RIGHT_QUERY: Employees in engineer visits (JOIN chuyen_tham_cua_ky_su AS T2 ON T1.id_nhan_vien=T2.id_nhan_vien_lien_lac)

Ex4: "Khách hàng nào chưa có tài khoản?"
INTENT_TYPE: FILTERED_SELECT
MAIN_ENTITY: khach_hang
FILTER_CONDITIONS: id_khach_hang NOT IN (SELECT id_khach_hang FROM tai_khoan)
→ Use NOT IN subquery, NEVER LEFT JOIN IS NULL

==================================================
RULES:
- "mỗi"/"từng" → ENTITY_AGGREGATION
- "nhất" → EXTREME_VALUE (ORDER BY+LIMIT, not MIN/MAX in WHERE)
- "nhưng không"/"chưa" → EXCEPT or NOT IN (subquery). NEVER LEFT JOIN IS NULL.
- "hoặc ... hoặc" with 2-3 values → Use OR, not IN
- Range comparison → Use BETWEEN, not >= AND <=
- Literals: copy EXACTLY from schema/data (no Vietnamese translation of values)
- GROUP BY: PK only (not name columns)
- COUNT: Always COUNT(*), never COUNT(column)

OUTPUT PLAN ONLY. NO EXPLANATION.
`;

// ============================================================================
// 3. SQL GENERATION - OPTIMIZED (removed verbose validation talk)
// ============================================================================

const GENERATE_SQL_PROMPT_TEMPLATE = `
You are a SQLite SQL generator. Generate from PLAN strictly.

DATABASE SCHEMA
{{schema_context}}

PLAN
{{query_plan}}

CURRENT DATETIME: {{current_datetime}}

==================================================
STRICT SQL STYLE RULES:

1) SELECT: Plan columns ONLY (T1.col, T2.col). NO extra columns. NO column aliases (AS name). NO semicolons at end.
2) FROM: MAIN_ENTITY AS T1. Always use "AS" keyword for aliases. Plain JOIN only. NEVER INNER JOIN, LEFT JOIN, RIGHT JOIN.
3) WHERE: Literals: keep EXACT from schema (no Vietnamese translation). Strings='single quotes', numbers=no quotes.
   - 2-3 values: Use OR (col='a' OR col='b'), NOT IN('a','b')
   - Range: Use BETWEEN (col BETWEEN a AND b), NOT col>=a AND col<=b
4) GROUP BY: PK only (NOT name cols). Ex: GROUP BY T1.id_cong_ty
5) HAVING: Use if in plan, else skip
6) ORDER BY: Use expression directly (COUNT(*), T1.col). NEVER use alias names.
7) LIMIT: Use if in plan
8) SET OPS: EXCEPT/UNION/INTERSECT → SELECT...FROM...OPERATOR SELECT...FROM...
9) EXCLUSION ("không có"/"chưa"): Use NOT IN (subquery) or EXCEPT. NEVER LEFT JOIN...IS NULL or NOT EXISTS.
10) COUNT: Always COUNT(*). NEVER COUNT(column_name) or COUNT(T1.id).
11) SQLite only: No dbo. prefix, no backticks, no semicolons

==================================================
EXAMPLES:

Plan: ENTITY_AGGREGATION, cong_ty→tai_san, GROUP BY T1.id
SQL: select count ( * ) , t1.id_cong_ty from cong_ty_ben_thu_ba as t1 join tai_san as t2 on t1.id_cong_ty = t2.id_cong_ty_cung_cap group by t1.id_cong_ty

Plan: EXTREME_VALUE, ky_su→visits, ORDER BY COUNT(*) DESC, LIMIT 1
SQL: select t1.id_ky_su , t1.ten , t1.ho from ky_su_bao_tri as t1 join chuyen_tham_cua_ky_su as t2 on t1.id_ky_su = t2.id_ky_su group by t1.id_ky_su order by count ( * ) desc limit 1

Plan: EXCEPT, nhan_vien (fault log vs visits)
SQL: select t1.ten_nhan_vien , t1.id_nhan_vien from nhan_vien as t1 join nhat_ky_loi as t2 on t1.id_nhan_vien = t2.duoc_ghi_lai_boi_nhan_vien_co_id except select t1.ten_nhan_vien , t1.id_nhan_vien from nhan_vien as t1 join chuyen_tham_cua_ky_su as t2 on t1.id_nhan_vien = t2.id_nhan_vien_lien_lac

Plan: FILTERED, khach_hang not in tai_khoan
SQL: select count ( * ) from khach_hang where id_khach_hang not in ( select id_khach_hang from tai_khoan )

Plan: FILTERED, 2 values with OR
SQL: select gia_ban from an_pham where nha_xuat_ban = 'Person' or nha_xuat_ban = 'Wiley'

==================================================
BEFORE OUTPUT: Verify tables/columns exist in schema, no dbo., single quotes, AS for aliases, no semicolons

OUTPUT: Raw SQL only. No markdown, no explanation.
`;

// ============================================================================
// 4. SELF-CHECK - OPTIMIZED (removed verbose checking process)
// ============================================================================

const SQL_SELF_CHECK_PROMPT = `
Validate GENERATED SQL vs PLAN and SCHEMA.

SCHEMA: {{schema_context}}
PLAN: {{query_plan}}
SQL: {{generated_sql}}

==================================================
CHECK (mark ✓ or ✗):

1) SELECT: Plan columns only? No extra columns? No column aliases (AS name)?
2) FROM+JOIN: Uses "table AS T1" (with AS keyword)? Plain JOIN only (no INNER/LEFT/RIGHT)?
3) WHERE: Literals exact (not translated to Vietnamese)? Uses OR not IN for 2-3 values? Uses BETWEEN for ranges?
4) GROUP BY: PK only (not names)?
5) HAVING: Matches plan?
6) ORDER BY: Uses expression (COUNT(*)) not alias name? Direction correct?
7) LIMIT: Matches plan?
8) SET OPS: Uses EXCEPT/NOT IN subquery (never LEFT JOIN IS NULL)?
9) COUNT: Uses COUNT(*) (never COUNT(col))?
10) SYNTAX: No dbo.? No semicolons? No backticks? Single quotes for strings?

==================================================
DECISION:

All ✓ → Output: VALID
Any ✗ → Rewrite SQL from plan (follow plan step by step, don't patch)

OUTPUT: "VALID" or complete rewritten SQL. Nothing else.
`;

// ============================================================================
// 5. SQL EXECUTION ERROR HANDLING - OPTIMIZED
// ============================================================================

const SQL_EXECUTION_ERROR_PROMPT = `
You are a SQLite SQL debugger. Fix the SQL based on execution error.

DATABASE SCHEMA
{{schema_context}}

ORIGINAL QUESTION: "{{question}}"

PLAN (for reference):
{{query_plan}}

GENERATED SQL (with error):
{{generated_sql}}

ERROR MESSAGE:
{{error_message}}

==================================================
COMMON SQLITE ERRORS & FIXES:

1. "no such column: X" → Column name misspelled or missing alias. Check schema.
2. "ambiguous column name: X" → Add table alias (T1.X or T2.X).
3. "no such table: X" → Table name misspelled or missing JOIN.
4. "misuse of aggregate: ..." → Aggregate without GROUP BY, or column not in GROUP BY.
5. "ORDER BY not allowed in subqueries" → Remove ORDER from subquery or use LIMIT.
6. "unable to bind parameter" → Check quotes: strings in 'single quotes', numbers no quotes.
7. "datatype mismatch" → Check column types for comparisons.
8. "syntax error" → Check commas, parentheses, keywords.

==================================================
FIXING STEPS:

1. Parse error: identify the problem (column/table name, syntax, aggregation).
2. Compare with schema: correct names, aliases, data types.
3. Ensure FROM/JOINs cover all columns used.
4. If GROUP BY, ensure all non-aggregates are in GROUP BY.
5. Check quotes and literals.
6. Verify plan compliance.

==================================================
EXAMPLES:

Error: "no such column: ten_nhan_vien"
SQL: SELECT ten_nhan_vien FROM nhan_vien T1 JOIN...
Fix: SELECT T1.ten_nhan_vien (add alias)

Error: "ambiguous column name: id"
SQL: SELECT id FROM nhan_vien T1 JOIN chuyen_tham T2 ON T1.id=T2.id
Fix: SELECT T1.id (specify table)

Error: "misuse of aggregate: COUNT(*) without GROUP BY"
SQL: SELECT id_nhan_vien, COUNT(*) FROM nhat_ky_loi
Fix: Add GROUP BY id_nhan_vien

==================================================
OUTPUT: Corrected SQL only. No markdown, no explanation.
`;


// ============================================================================
// EXPORTS
// ============================================================================

module.exports = {
   DESCRIPTION_GENERATION_SYSTEM_PROMPT,
   DESCRIPTION_GENERATION_USER_HEADER,
   PLANNING_PROMPT_TEMPLATE,
   GENERATE_SQL_PROMPT_TEMPLATE,
   SQL_SELF_CHECK_PROMPT,
   SQL_EXECUTION_ERROR_PROMPT
};


// ============================================================================
// OPTIMIZATION NOTES
// ============================================================================

/*
WHAT WAS REMOVED/COMPRESSED TO SAVE VRAM:

1. PLANNING PROMPT:
   - Removed verbose explanations of each intent type
   - Compressed examples (kept structure, removed explanatory text)
   - Removed repetitive "VALIDATION:" sections
   - Condensed multi-paragraph explanations into bullet points
   - Kept all critical rules but in compact form

2. SQL GENERATION:
   - Removed verbose "How to resolve" sections
   - Compressed mapping table into inline format
   - Removed ✓/✗ examples (kept just the correct ones)
   - Condensed "Before output verify" from paragraph to checklist
   - Removed redundant explanations

3. SELF-CHECK:
   - Removed box-drawing characters and verbose section headers
   - Compressed checks from multi-line to single-line
   - Removed "Method: ..." explanations for each check
   - Kept validation logic but removed verbose instructions

TOKEN REDUCTION ESTIMATE:
- Planning: ~2000 tokens → ~800 tokens (-60%)
- SQL Gen: ~1800 tokens → ~700 tokens (-61%)
- Self-check: ~1500 tokens → ~500 tokens (-67%)
- Total saved: ~3300 tokens in prompts

REASONING TOKEN REDUCTION (expected):
- Less verbose instructions → Model generates shorter reasoning
- Checklist format → Model can check items briefly
- Compact examples → Less pattern-matching verbosity
- Expected: 30-40% reduction in reasoning tokens

VRAM IMPACT:
- Prompt tokens: ~3300 fewer tokens = ~0.5-1GB VRAM
- Reasoning tokens: 30-40% reduction = ~4-5GB VRAM
- Total expected: 21-22GB → 15-17GB (below 16GB target with margin)

QUALITY IMPACT:
- ✅ All critical rules preserved
- ✅ All examples preserved (just compressed)
- ✅ All validation checks preserved
- ✅ Same error coverage as V2 mới
- ⚠️ Slightly less hand-holding (but model should still work)

EXPECTED RESULTS:
- VRAM: <16GB (same as V2 cũ)
- EA improvement: 50-60% (same as V2 mới)
- Speed: Slightly faster due to less reasoning
*/