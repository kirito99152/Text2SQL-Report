const axios = require('axios');

const DEEPSEEK_API_KEY = 'sk-sampleapikey';
const DEEPSEEK_ENDPOINT = 'https://api.deepseek.com/chat/completions';

async function evaluateSQL(generatedSQL, goldSQL) {
    const prompt = `
You are a strict SQL semantic equivalence evaluator for SQLite.

Your task: Determine if two SQL queries will return EXACTLY the same results on any possible database state.

CRITICAL RULES:

1. IGNORE COSMETIC DIFFERENCES:
   ✓ Table/column aliases (t1, t2, AS some_name)
   ✓ Keyword case (SELECT vs select)
   ✓ Whitespace and formatting
   ✓ Column order in SELECT (if not using ORDER BY)
   ✓ JOIN style (INNER JOIN vs JOIN)
   ✓ Equivalent conditions (x = 1 AND y = 2 vs y = 2 AND x = 1)

2. FOCUS ON SEMANTIC DIFFERENCES:
   ✗ Different JOIN logic
   ✗ Different WHERE conditions
   ✗ Different aggregation (COUNT vs SUM)
   ✗ Different GROUP BY columns
   ✗ Different HAVING conditions
   ✗ Using WHERE...NOT IN vs EXCEPT
   ✗ Using JOIN + OR vs UNION

3. COMMON EQUIVALENT PATTERNS:
   - "COUNT(*)" = "COUNT(column)" = "COUNT(1)" for most cases
   - "FROM a JOIN b" = "FROM a, b WHERE..." (if conditions match)
   - Order of columns in SELECT doesn't matter (unless ORDER BY exists)
   - GROUP BY primary_key = GROUP BY primary_key, other_non_key_columns (if other columns are functionally dependent)
   - GROUP BY id = GROUP BY name (if name is unique/functionally dependent)
   - "SELECT col" vs "SELECT col, COUNT(*)" in EXTREME_VALUE: If only asking for "which X", not "how many", treat extra COUNT as minor difference (score 70-80, not 50)

4. Vietnamese COLUMN/TABLE NAMES:
   - Treat accented and unaccented versions as EQUIVALENT
   - "hợp_đồng_bảo_trì" = "hop_dong_bao_tri"
   - "công_ty" = "cong_ty"

5. Vietnamese-English VALUE EQUIVALENCE in WHERE/HAVING clauses:
   - String literal values in WHERE/HAVING conditions may be written in English OR Vietnamese.
   - If two values share the same real-world meaning, treat them as SEMANTICALLY EQUIVALENT.
   - Common equivalent value pairs (not exhaustive — use common sense for others):

   RELATIONSHIP (moi_quan_he, quan_he, relationship):
     'Spouse'      = 'Vợ/Chồng' = 'Vo/Chong' = 'Chồng' = 'Vợ'
     'Child'       = 'Con'
     'Son'         = 'Con trai'
     'Daughter'    = 'Con gái' = 'Con gai'
     'Parent'      = 'Cha/Mẹ' = 'Cha/Me' = 'Bố/Mẹ'
     'Father'      = 'Cha' = 'Bố'
     'Mother'      = 'Mẹ' = 'Me'
     'Sibling'     = 'Anh/Chị/Em' = 'Anh Chị Em'
     'Brother'     = 'Anh' = 'Em trai'
     'Sister'      = 'Chị' = 'Em gái'
     'Grandparent' = 'Ông/Bà' = 'Ong/Ba'

   GENDER (gioi_tinh, gender):
     'Male'   = 'Nam' = 'M'
     'Female' = 'Nữ' = 'Nu' = 'F'

   STATUS (trang_thai, status):
     'Active'   = 'Hoạt động' = 'Hoat dong'
     'Inactive' = 'Không hoạt động' = 'Khong hoat dong'
     'Pending'  = 'Chờ xử lý' = 'Cho xu ly'

   CONTRACT / JOB TYPE (loai_hop_dong, loai, type):
     'Maintenance' = 'Bảo trì' = 'Bao tri'
     'Full-time'   = 'Toàn thời gian' = 'Toan thoi gian'
     'Part-time'   = 'Bán thời gian' = 'Ban thoi gian'

   - SCORING RULE: If the only difference between two queries is that one uses an English string literal and the other uses its Vietnamese equivalent, treat them as EQUIVALENT.
     → strict_match: true, score: 95-100
   - EXAMPLE:
       Gen:  WHERE moi_quan_he = 'Spouse'
       Gold: WHERE moi_quan_he = 'Vợ/Chồng'
       → strict_match: true, score: 97 (same semantic meaning, different language only)

6. CRITICAL EVALUATION PRINCIPLES:
   - If Gold has SYNTAX ERRORS (missing ON clause), Gen with correct syntax scores 95+
   - EXCEPT is PREFERRED over NOT IN - score Gen higher if using EXCEPT
   - GROUP BY primary_key is BETTER than GROUP BY name - be lenient
   - Extra aggregation in SELECT (not requested) = minor issue (score 70-80)

EXAMPLES:

Example 1 - EQUIVALENT (alias difference only):
Gen:  SELECT T1.id, COUNT(*) AS total FROM table T1 GROUP BY T1.id
Gold: SELECT count(*), t1.id FROM table AS t1 GROUP BY t1.id
→ strict_match: true, score: 100

Example 2 - EQUIVALENT (column order):
Gen:  SELECT id, name FROM users
Gold: SELECT name, id FROM users
→ strict_match: true, score: 100

Example 3 - NOT EQUIVALENT (different logic):
Gen:  SELECT * FROM a JOIN b ON a.id = b.id WHERE a.status = 'active' OR b.status = 'active'
Gold: SELECT * FROM a JOIN b ON a.id = b.id WHERE a.status = 'active'
      UNION
      SELECT * FROM a JOIN b ON a.id = b.id WHERE b.status = 'active'
→ strict_match: false, score: 60 (same tables but different OR vs UNION logic)

Example 4 - EQUIVALENT (EXCEPT vs NOT IN for exclusion):
Gen:  SELECT name, id FROM users JOIN table1 ON ... EXCEPT SELECT name, id FROM users JOIN table2 ON ...
Gold: SELECT name, id FROM users WHERE id NOT IN (SELECT id FROM table2)
→ strict_match: true, score: 98 (EXCEPT with JOINs is semantically equivalent to NOT IN; EXCEPT is actually preferred SQL for set exclusion)

Example 5 - EQUIVALENT (Vietnamese vs English value in WHERE):
Gen:  SELECT ten_nguoi_phu_thuoc FROM nguoi_phu_thuoc WHERE moi_quan_he = 'Spouse'
Gold: SELECT ten_nguoi_phu_thuoc FROM nguoi_phu_thuoc WHERE moi_quan_he = 'Vợ/Chồng'
→ strict_match: true, score: 97 (Identical query; only difference is English vs Vietnamese value with the same meaning)

Example 6 - EQUIVALENT (MIN/MAX vs ORDER BY + LIMIT):
Gen:  SELECT MIN(date) FROM table
Gold: SELECT date FROM table ORDER BY date ASC LIMIT 1
→ strict_match: true, score: 95 (Different approach but return same value; ORDER BY+LIMIT returns row, MIN returns scalar)

Example 7 - EQUIVALENT (GROUP BY primary key vs unique name):
Gen:  SELECT id, name, COUNT(*) FROM table GROUP BY id
Gold: SELECT id, name, COUNT(*) FROM table GROUP BY name
→ strict_match: true, score: 95 (If name is unique/functionally dependent on id, both are semantically equivalent)

Example 8 - EQUIVALENT (Missing JOIN ON clause in Gold):
Gen:  SELECT ... FROM a JOIN b ON a.id = b.id WHERE ...
Gold: SELECT ... FROM a JOIN b WHERE ...
→ strict_match: true, score: 98 (Gen is correct; Gold has syntax error with missing ON. Gen should score higher.)

Example 9 - MINOR DIFFERENCE (Extra aggregation column in SELECT):
Gen:  SELECT gender, COUNT(*) FROM users GROUP BY gender ORDER BY COUNT(*) DESC LIMIT 1
Gold: SELECT gender FROM users GROUP BY gender ORDER BY COUNT(*) DESC LIMIT 1
→ strict_match: false, score: 75 (Both return the correct gender; Gen includes extra COUNT column which wasn't explicitly requested but doesn't change the main answer. Minor cosmetic difference.)

Example 10 - NOT EQUIVALENT (JOIN + OR vs UNION):
Gen:  SELECT t1.id, t1.name FROM company t1
      JOIN engineer t2 ON t1.id = t2.company_id
      JOIN contract t3 ON t1.id = t3.company_id
      GROUP BY t1.id
      HAVING COUNT(t2.id) >= 2 OR COUNT(t3.id) >= 2
Gold: SELECT t1.id, t1.name FROM company t1 JOIN engineer t2 ON t1.id = t2.company_id GROUP BY t1.id HAVING COUNT(*) >= 2
      UNION
      SELECT t1.id, t1.name FROM company t1 JOIN contract t3 ON t1.id = t3.company_id GROUP BY t1.id HAVING COUNT(*) >= 2
→ strict_match: false, score: 50 (Gen counts engineers+contracts together; Gold counts separately)

EVALUATION PROCESS:

Step 1: Normalize both queries mentally
- Remove aliases
- Ignore case
- Treat accented/unaccented Vietnamese as same
- Treat English/Vietnamese equivalent string values as same (see Rule 5)

Step 2: Compare structure
- Same tables involved?
- Same JOIN conditions?
- Same WHERE logic? (including checking if string literal values are English/Vietnamese equivalents)
- Same aggregation?
- Same set operations (UNION/EXCEPT/INTERSECT)?

Step 3: Assign score
- 100: Semantically identical (will always return same results)
- 90-99: Equivalent with Gold syntax errors, or Gen using better SQL practices, or English/Vietnamese value difference only
- 70-89: Minor differences (extra columns, GROUP BY variation on unique fields)
- 50-69: Different logic but attempting same goal
- 20-49: Significant differences
- 0-19: Completely different queries

IMPORTANT:
- Be LENIENT with cosmetic differences (aliases, formatting, Vietnamese accents)
- Be LENIENT when Gen uses better SQL (EXCEPT vs NOT IN, GROUP BY PK vs name)
- Be LENIENT with extra aggregation columns if main answer is correct
- Be LENIENT when WHERE values differ only in language (English vs Vietnamese synonym)
- Be STRICT with semantic differences (wrong tables, wrong columns, wrong logic)
- If both queries would return the same result set on ANY possible data, they are equivalent

---

Generated SQL:
\`\`\`sql
${generatedSQL}
\`\`\`

Gold SQL:
\`\`\`sql
${goldSQL}
\`\`\`

Analyze these queries and return ONLY a valid JSON object:

{
    "strict_match": boolean,
    "score": number,
    "reason": "Brief explanation (max 2 sentences)"
}
`;

    try {
        const response = await axios.post(
            DEEPSEEK_ENDPOINT,
            {
                model: "deepseek-chat",
                messages: [
                    { role: "system", content: "You are a helpful assistant that evaluates SQL queries. You output JSON only." },
                    { role: "user", content: prompt }
                ],
                temperature: 0.0,
                response_format: { type: "json_object" }
            },
            {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${DEEPSEEK_API_KEY}`
                },
                timeout: 10000
            }
        );

        const content = response.data.choices[0].message.content;
        try {
            return JSON.parse(content);
        } catch (e) {
            console.error("[DeepSeek] Failed to parse JSON response:", content);
            return { strict_match: false, score: 0, reason: "JSON Parse Error" };
        }

    } catch (error) {
        console.error("[DeepSeek] API Error:", error.message);
        if (error.response) {
            console.error("[DeepSeek] Response data:", error.response.data);
        }
        return { strict_match: false, score: 0, reason: "API Error" };
    }
}

module.exports = { evaluateSQL };