// src/prompts_retry.js - RETRY VERSION (COMPACT BUT PRECISE)
// Purpose: Fallback prompts when original prompts cause timeout/too-long reasoning.
// Strategy: Keep ALL critical rules but remove verbose examples and explanations.
// NOTE: Description prompt is NOT included - it rarely fails.

// ============================================================================
// 1. PLANNING PROMPT - RETRY
// ============================================================================

const PLANNING_PROMPT_TEMPLATE = `
SQL planner. Transform question → structured plan. Think step by step but keep reasoning SHORT.

DATABASE SCHEMA
{{schema_context}}

⚠️ Read column descriptions carefully - action verbs show WHO did WHAT:
"đã GHI LẠI" = RECORDED | "đã LIÊN LẠC" = CONTACTED | "đã CUNG CẤP" = PROVIDED

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
G) SET_OPERATION - "nhưng không"/"chưa"→EXCEPT | "vừa...vừa"/"cả...và"→INTERSECT
H) UNION_OPERATION - "A hoặc B nhưng C" where C applies only to B → UNION

==================================================
CRITICAL RULES:

⚠️ SINGLE TABLE (top error source):
- ALL columns in ONE table → query ONLY that table. ⛔ NEVER add JOINs.

⚠️ SELECT RULES:
- ONLY columns question EXPLICITLY asks. ⛔ No extra columns.
- "tên" → SELECT ten ONLY. NOT ho, ten.
- "tên đầy đủ"/"họ và tên" → SELECT ho, ten (two columns). NEVER CONCAT.
- "bao nhiêu" → SELECT COUNT(*). No other columns unless asked.
- EXTREME_VALUE: COUNT/SUM in ORDER BY only. ⛔ NEVER in SELECT.

⚠️ JOIN RULES:
- Question names entity → that table in FROM
- "X của từng Y" → Y is main entity
- M:N → use junction table

⚠️ EXCLUSION ("chưa có"/"không có"):
- Simple (entity NOT IN another) → NOT IN subquery
- Two entity sets compared → EXCEPT
- ⛔ NEVER LEFT JOIN...IS NULL

⚠️ VALUE & FILTER RULES:
- String values: ENGLISH exactly as in schema. ⛔ NEVER translate to Vietnamese.
- "hoặc...hoặc" 2-3 values → OR, not IN
- Range → BETWEEN
- "từ X trở lên"/"ít nhất X" → >= | "hơn X"/"nhiều hơn X" → >
- "nhất" → ORDER BY+LIMIT, not MIN/MAX in WHERE

⚠️ GROUP BY:
- GROUP BY column in SELECT (not aggregate)
- COUNT always COUNT(*), never COUNT(column)
- "số lượng"/"bao nhiêu loại" → COUNT(DISTINCT col)

==================================================
OUTPUT FORMAT:
INTENT_TYPE: <A-H>
MAIN_ENTITY: <table>
JOINED_TABLES: <tables> | NONE
JOIN_CONDITIONS: <T1.col=T2.col> | NONE
SELECT_COLUMNS: <ONLY columns asked, nothing extra>
FILTER_CONDITIONS: <conditions> | NONE
AGGREGATION:
- TYPE: NONE|GLOBAL|ENTITY
- FUNCTION: COUNT|SUM|AVG|MIN|MAX|NONE
- TARGET_COLUMN: <col|*>
- GROUP_BY: <col> | NONE
- HAVING: <condition> | NONE
ORDERING:
- ORDER_BY: <expr> | NONE
- DIRECTION: ASC|DESC | NONE
- LIMIT: <num> | NONE
SET_OPERATION: NONE|EXCEPT|UNION|INTERSECT
- LEFT_QUERY: <desc>
- RIGHT_QUERY: <desc>

OUTPUT PLAN ONLY. NO EXPLANATION.
`;

// ============================================================================
// 2. SQL GENERATION - RETRY
// ============================================================================

const GENERATE_SQL_PROMPT_TEMPLATE = `
SQLite SQL generator. Generate from PLAN strictly. Keep reasoning SHORT.

DATABASE SCHEMA
{{schema_context}}

PLAN
{{query_plan}}

CURRENT DATETIME: {{current_datetime}}

==================================================
⚠️ STRICT SQL RULES (ALL mandatory):

1) SELECT: EXACTLY plan columns, EXACTLY plan order. ⛔ No extra columns. ⛔ No aliases (AS name).
   - "tên" → ten only | "tên đầy đủ" → ho, ten (two cols). ⛔ NEVER CONCAT/||.
   - EXTREME_VALUE → COUNT(*)/SUM() in ORDER BY only, NOT SELECT.
2) FROM: table AS T1. Plain "JOIN" only. ⛔ NEVER INNER JOIN or LEFT JOIN.
3) WHERE: String values MUST be ENGLISH as in database. ⛔ NEVER Vietnamese.
   - 2-3 values → OR (not IN). Ranges → BETWEEN.
   - "từ X trở lên" → >= | "hơn X" → >
4) GROUP BY: Match plan alias EXACTLY. GROUP BY the FK/joined column.
5) ORDER BY: Use expression directly (COUNT(*)). ⛔ NEVER alias names.
6) SET OPS: Use EXACTLY what plan says (EXCEPT/UNION/INTERSECT).
   - ⛔ NEVER replace EXCEPT with NOT IN/NOT EXISTS.
   - ⛔ NEVER replace INTERSECT with AND/EXISTS.
   - Each side must be a complete SELECT...FROM... query.
7) EXCLUSION: PREFER EXCEPT. If NOT IN → use subquery. ⛔ NEVER LEFT JOIN IS NULL.
8) COUNT: Always COUNT(*). ⛔ NEVER COUNT(column_name).
9) No dbo., no backticks, no semicolons, no newlines. Single line output.
10) SINGLE TABLE: If plan has no JOINs → do NOT add any. Query ONE table directly.
11) DISTINCT: Use if plan says. ⛔ Do NOT replace with GROUP BY HAVING.

==================================================
OUTPUT: Raw SQL on single line. No markdown, no explanation.
`;

// ============================================================================
// 3. SELF-CHECK - RETRY
// ============================================================================

const SQL_SELF_CHECK_PROMPT = `
Validate SQL vs PLAN and SCHEMA. Keep reasoning SHORT.

SCHEMA: {{schema_context}}
PLAN: {{query_plan}}
SQL: {{generated_sql}}

==================================================
CHECK each (✓ or ✗):
1) SELECT: EXACTLY plan columns? No extras? No aliases (AS)? Order matches?
2) JOIN: Plain "JOIN" only? (INNER/LEFT → rewrite)
3) WHERE values: ENGLISH as in DB? ⛔ Vietnamese = WRONG.
4) WHERE operators: ">=" vs ">" correct per question?
5) GROUP BY: Correct alias per plan?
6) ORDER BY: Expression not alias? Direction? LIMIT?
7) SET OPS: Plan says EXCEPT → SQL uses EXCEPT? (not NOT IN/NOT EXISTS)
   Plan says INTERSECT → SQL uses INTERSECT? (not AND/EXISTS)
   Plan says UNION → SQL uses UNION? (not OR)
8) SINGLE TABLE: No unnecessary JOINs if plan has none?
9) COUNT(*) only? No || or CONCAT? Single line? No semicolons?

==================================================
FIXES if needed:
- INNER JOIN → JOIN | LEFT JOIN IS NULL → EXCEPT or NOT IN subquery
- SELECT col AS name → remove AS name
- ho || ' ' || ten → ho, ten (separate)
- Vietnamese values → English (check schema)

DECISION:
All ✓ → Output: VALID
Any ✗ → Output: corrected SQL, single line only.
`;

// ============================================================================
// 4. SQL EXECUTION ERROR - RETRY
// ============================================================================

const SQL_EXECUTION_ERROR_PROMPT = `
SQLite SQL debugger. Fix SQL based on error. Keep reasoning SHORT.

DATABASE SCHEMA
{{schema_context}}

ORIGINAL QUESTION: "{{question}}"

PLAN:
{{query_plan}}

SQL (with error):
{{generated_sql}}

ERROR:
{{error_message}}

==================================================
COMMON FIXES:
- "no such column: X" → Check schema for correct name, add table alias
- "ambiguous column: X" → Add alias (T1.X or T2.X)
- "no such table: X" → Check spelling, missing JOIN
- "misuse of aggregate" → Add GROUP BY or fix non-aggregate in SELECT
- "syntax error" → Check commas, parentheses, keywords

STEPS:
1. Parse error → identify problem
2. Compare with schema → correct names/aliases/types
3. Ensure FROM/JOINs cover all used columns
4. If GROUP BY → all non-aggregates must be in GROUP BY
5. Verify plan compliance

==================================================
OUTPUT: Corrected SQL only. Single line. No markdown, no explanation.
`;

// ============================================================================
// 5. SCHEMA SELECTION - RETRY
// ============================================================================

const SCHEMA_SELECTION_PROMPT = `You are a schema selector for Text-to-SQL. Select ONLY relevant tables needed to answer the question.

DATABASE TABLES:
{{table_list}}

QUESTION: "{{question}}"

{{schema_linking_hints}}

RULES:
- Select ONLY tables needed (max 10)
- Include junction tables for M:N relationships
- Include FK-connected tables if needed for JOINs
- If unsure, include the table (better extra than miss)

Respond with ONLY a JSON array of table names, nothing else.
Example: ["table1", "table2"]
`;

// ============================================================================
// EXPORTS
// ============================================================================

module.exports = {
   PLANNING_PROMPT_TEMPLATE,
   GENERATE_SQL_PROMPT_TEMPLATE,
   SQL_SELF_CHECK_PROMPT,
   SQL_EXECUTION_ERROR_PROMPT,
   SCHEMA_SELECTION_PROMPT
};


// ============================================================================
// DESIGN NOTES
// ============================================================================

/*
COMPARED TO prompts.js (ORIGINAL):

1. PLANNING PROMPT:
   - Removed: All 4 detailed examples (Ex1-Ex4)
   - Kept: ALL intent classifications, ALL critical rules
   - Kept: Output format identical
   - Added: "Keep reasoning SHORT" directive

2. SQL GENERATION:
   - Removed: All 10 examples
   - Removed: "FINAL CHECK" section (redundant with self-check step)
   - Kept: ALL 11 style rules with exact same constraints
   - Added: "Keep reasoning SHORT" directive

3. SELF-CHECK:
   - Removed: Verbose explanations
   - Kept: ALL 9 check items, ALL common fixes
   - Same output format (VALID or corrected SQL)

4. EXECUTION ERROR:
   - Removed: Detailed examples for each error type
   - Kept: ALL common error patterns, ALL fixing steps
   - Same output format

TOKEN REDUCTION: ~40-50% fewer prompt tokens
REASONING REDUCTION: Expected 50-60% shorter (no examples to pattern-match against)
ACCURACY: Should be similar - all rules preserved, only examples removed
*/
