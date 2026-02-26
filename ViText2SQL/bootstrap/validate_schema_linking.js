/**
 * Full Pipeline Schema Linking Validation
 * 
 * Flow for schemas > 10 tables:
 * 1. Token matching + FK expansion (local, instant)
 * 2. AI Schema Selection via Request-Hub/Qwen3-8B (production model)
 * 3. DeepSeek validates if selected tables cover gold SQL
 * 
 * Schemas ≤ 10 tables are auto-skipped (all tables used).
 */

const fs = require('fs');
const path = require('path');
const axios = require('axios');

// ─── Config ──────────────────────────────────────────────────────────────
const DEEPSEEK_API_KEY = 'sk-fd04a1340f9449568f3b6f5c33a2d7aa';
const DEEPSEEK_ENDPOINT = 'https://api.deepseek.com/chat/completions';
const REQUEST_HUB_URL = 'http://localhost:5001/generate_output';

const DEEPSEEK_WORKERS = 10;  // concurrent DeepSeek validation calls
const QWEN_WORKERS = 2;       // concurrent Request-Hub calls (matches 2 endpoints)
const MAX_TABLES = 10;

const DATA_DIR = path.resolve(__dirname, '../data/syllable-level');
const TEST_FILE = path.join(DATA_DIR, 'test.json');
const TABLES_FILE = path.join(DATA_DIR, 'tables.json');
const OUTPUT_FILE = path.resolve(__dirname, 'logs/schema_linking_full_pipeline.json');

// ─── Schema Linking Service (inline) ─────────────────────────────────────
class SchemaLinkingService {
    constructor() {
        this.tablesData = null;
        this.schemasMap = {};
    }

    _ensureLoaded() {
        if (this.tablesData) return;
        const raw = fs.readFileSync(TABLES_FILE, 'utf-8');
        this.tablesData = JSON.parse(raw);
        for (const schema of this.tablesData) {
            this.schemasMap[schema.db_id] = schema;
        }
        console.log(`[SchemaLinking] Loaded ${this.tablesData.length} schemas`);
    }

    generateLinkingWithRelevantTables(question, dbId) {
        this._ensureLoaded();
        if (!dbId || !this.schemasMap[dbId]) {
            return { linkingText: "", relevantTables: null, matchedCount: 0, totalTables: 0 };
        }
        const rawSchema = this.schemasMap[dbId];
        const totalTables = rawSchema.table_names.length;
        const { linkingText, matchedTableIndices } = this._matchTokens(question, rawSchema);
        if (matchedTableIndices.size === 0) {
            return { linkingText, relevantTables: null, matchedCount: 0, totalTables };
        }
        const expandedIndices = this._expandViaFK(matchedTableIndices, rawSchema);
        const tableNames = rawSchema.table_names || [];
        const relevantTables = new Set();
        for (const idx of expandedIndices) {
            if (idx < tableNames.length) relevantTables.add(tableNames[idx]);
        }
        return { linkingText, relevantTables, matchedCount: matchedTableIndices.size, totalTables };
    }

    _expandViaFK(matchedIndices, rawSchema) {
        const expanded = new Set(matchedIndices);
        const foreignKeys = rawSchema.foreign_keys || [];
        const colNames = rawSchema.column_names || [];
        const adjacency = {};
        for (const [srcIdx, tgtIdx] of foreignKeys) {
            const s = colNames[srcIdx]?.[0]; const t = colNames[tgtIdx]?.[0];
            if (s === undefined || t === undefined || s === -1 || t === -1) continue;
            if (!adjacency[s]) adjacency[s] = new Set();
            if (!adjacency[t]) adjacency[t] = new Set();
            adjacency[s].add(t); adjacency[t].add(s);
        }
        for (const idx of matchedIndices) {
            if (adjacency[idx]) { for (const n of adjacency[idx]) expanded.add(n); }
        }
        const arr = [...matchedIndices];
        for (let i = 0; i < arr.length; i++) {
            for (let j = i + 1; j < arr.length; j++) {
                const ni = adjacency[arr[i]] || new Set();
                const nj = adjacency[arr[j]] || new Set();
                for (const n of ni) { if (nj.has(n)) expanded.add(n); }
            }
        }
        return expanded;
    }

    _matchTokens(question, rawSchema) {
        const qClean = question.toLowerCase().replace(/[.,;:!?()\[\]{}"'`]/g, ' ');
        const tableOriginals = rawSchema.table_names_original || [];
        const tableNames = rawSchema.table_names || [];
        const colOriginals = rawSchema.column_names_original || [];
        const colNames = rawSchema.column_names || [];
        const primaryKeys = new Set(rawSchema.primary_keys || []);
        const fkMap = {};
        for (const [s, t] of (rawSchema.foreign_keys || [])) fkMap[s] = t;
        const matched = []; const matchedSet = new Set(); const matchedTableIndices = new Set();

        const tablePhrases = [];
        for (let tIdx = 0; tIdx < tableOriginals.length; tIdx++) {
            const orig = tableOriginals[tIdx];
            if (orig && orig !== '*') tablePhrases.push({ orig: orig.toLowerCase(), tIdx, tname: tableNames[tIdx] });
        }
        tablePhrases.sort((a, b) => b.orig.length - a.orig.length);
        for (const { orig, tIdx, tname } of tablePhrases) {
            if (qClean.includes(orig)) {
                const key = `table:${tname}`;
                if (!matchedSet.has(key)) { matched.push(`- "${orig}" → ${tname} (bảng)`); matchedSet.add(key); matchedTableIndices.add(tIdx); }
            }
        }

        const GENERIC_SHORT = new Set(['id', 'tên', 'năm', 'ngày', 'số', 'loại', 'mã']);
        const colPhrases = [];
        for (let cIdx = 0; cIdx < colOriginals.length; cIdx++) {
            const pair = colOriginals[cIdx];
            if (pair[0] === -1) continue;
            const origName = pair[1]; if (!origName || origName === '*') continue;
            const origLower = origName.toLowerCase(); const tIdx = pair[0];
            const colSqlName = cIdx < colNames.length ? colNames[cIdx][1] : origName;
            const tSqlName = tIdx < tableNames.length ? tableNames[tIdx] : '?';
            colPhrases.push({ origLower, tSqlName, colSqlName, cIdx, tIdx });
        }
        colPhrases.sort((a, b) => { const aw = a.origLower.split(' ').length; const bw = b.origLower.split(' ').length; if (bw !== aw) return bw - aw; return b.origLower.length - a.origLower.length; });
        for (const { origLower, tSqlName, colSqlName, cIdx, tIdx } of colPhrases) {
            const tokens = origLower.split(' ');
            if (tokens.length < 2 && GENERIC_SHORT.has(origLower)) continue;
            if (origLower.length < 2) continue;
            if (qClean.includes(origLower)) {
                const key = `col:${tSqlName}.${colSqlName}`;
                if (!matchedSet.has(key)) {
                    let suffix = "";
                    if (primaryKeys.has(cIdx)) { suffix = " [PK]"; }
                    else if (fkMap[cIdx] !== undefined) { const ti = fkMap[cIdx]; if (ti < colNames.length) { const tt = colNames[ti][0]; const tc = colNames[ti][1]; const tn = tt < tableNames.length ? tableNames[tt] : '?'; suffix = ` [FK→${tn}.${tc}]`; } }
                    matched.push(`- "${origLower}" → ${tSqlName}.${colSqlName}${suffix}`);
                    matchedSet.add(key); matchedTableIndices.add(tIdx);
                }
            }
        }
        const linkingText = matched.length === 0 ? "" : "SCHEMA LINKING:\n" + matched.join("\n");
        return { linkingText, matchedTableIndices };
    }

    getRawSchema(dbId) {
        this._ensureLoaded();
        return this.schemasMap[dbId];
    }

    getSchemaTableNames(dbId) {
        this._ensureLoaded();
        const rawSchema = this.schemasMap[dbId];
        return rawSchema ? rawSchema.table_names : [];
    }
}

// ─── Build table list for AI prompt ──────────────────────────────────────
function buildTableListForPrompt(rawSchema) {
    const tableNames = rawSchema.table_names || [];
    const colNames = rawSchema.column_names || [];
    let tableList = "";
    for (let tIdx = 0; tIdx < tableNames.length; tIdx++) {
        const cols = colNames
            .filter(c => c[0] === tIdx)
            .map(c => c[1]);
        tableList += `- ${tableNames[tIdx]} (${cols.join(', ')})\n`;
    }
    return tableList;
}

// ─── Request-Hub call (Qwen3-8B AI Schema Selection) ─────────────────────
const SCHEMA_SELECTION_PROMPT = `You are a schema selector for Text-to-SQL. Given a Vietnamese question and database tables, select ONLY the relevant tables needed to answer the question.

DATABASE TABLES:
{{table_list}}

{{schema_linking_hints}}

QUESTION: "{{question}}"

RULES:
- Select ONLY tables needed to answer the question (max 10)
- Include junction/bridge tables needed for M:N relationships
- Include tables connected by foreign keys if needed for JOINs
- Do NOT include tables unrelated to the question
- If unsure, include the table (better to have extra than miss one)

Respond with ONLY a JSON array of table names, nothing else.
Example: ["table1", "table2", "table3"]
`;

async function callQwenSchemaSelection(question, tableList, linkingText, retries = 2) {
    let prompt = SCHEMA_SELECTION_PROMPT;
    prompt = prompt.replace('{{table_list}}', tableList);
    prompt = prompt.replace('{{question}}', question);
    prompt = prompt.replace('{{schema_linking_hints}}', linkingText
        ? `SCHEMA LINKING HINTS (token matching):\n${linkingText}`
        : '');

    const payload = {
        messages: [
            { role: 'system', content: 'You are a precise schema selector. Output ONLY a JSON array.' },
            { role: 'user', content: prompt }
        ],
        gen: {
            max_new_tokens: 2000,
            do_sample: false,
            enable_thinking: false
        }
    };

    try {
        const response = await axios.post(REQUEST_HUB_URL, payload, {
            headers: { 'Content-Type': 'application/json' },
            timeout: 120000  // 2 min timeout
        });

        if (response.data && response.data.output) {
            return response.data.output;
        }
        throw new Error('No output in response');
    } catch (error) {
        if (retries > 0) {
            await sleep(1000);
            return callQwenSchemaSelection(question, tableList, linkingText, retries - 1);
        }
        throw error;
    }
}

function parseTableList(response, validTableNames) {
    const validSet = new Set(validTableNames);
    const result = new Set();
    try {
        let cleaned = response.trim();
        const thinkEnd = cleaned.indexOf('</think>');
        if (thinkEnd !== -1) cleaned = cleaned.substring(thinkEnd + 8).trim();
        const startBracket = cleaned.indexOf('[');
        const endBracket = cleaned.lastIndexOf(']');
        if (startBracket !== -1 && endBracket !== -1) {
            const parsed = JSON.parse(cleaned.substring(startBracket, endBracket + 1));
            if (Array.isArray(parsed)) {
                for (const name of parsed) {
                    if (typeof name === 'string' && validSet.has(name)) result.add(name);
                }
            }
        }
    } catch (e) { /* ignore parse errors */ }
    return result;
}

// ─── DeepSeek validation ─────────────────────────────────────────────────
async function callDeepSeekValidation(question, goldSQL, selectedTables, allTables) {
    const prompt = `You are evaluating schema linking quality for a Vietnamese Text-to-SQL system.

QUESTION: "${question}"

GOLD SQL:
\`\`\`sql
${goldSQL}
\`\`\`

ALL TABLES IN DATABASE: [${allTables.join(', ')}]
AI SELECTED TABLES: [${[...selectedTables].join(', ')}]

EVALUATE:
1. Which tables does the gold SQL actually use?
2. Are ALL those tables present in AI SELECTED TABLES?
3. Are there EXTRA unnecessary tables?

Return ONLY JSON:
{
    "gold_tables": ["t1", "t2"],
    "all_covered": true/false,
    "missing_tables": [],
    "extra_tables": [],
    "quality": "perfect" | "good" | "partial" | "bad"
}`;

    try {
        const response = await axios.post(DEEPSEEK_ENDPOINT, {
            model: "deepseek-chat",
            messages: [
                { role: "system", content: "You evaluate schema linking. Output JSON only." },
                { role: "user", content: prompt }
            ],
            temperature: 0.0,
            response_format: { type: "json_object" }
        }, {
            headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${DEEPSEEK_API_KEY}` },
            timeout: 30000
        });
        return JSON.parse(response.data.choices[0].message.content);
    } catch (error) {
        if (error.response?.status === 429) {
            await sleep(2000);
            return callDeepSeekValidation(question, goldSQL, selectedTables, allTables);
        }
        return { error: error.message, all_covered: null, quality: "error" };
    }
}

function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

// ─── Phase 1: AI Schema Selection via Request-Hub ────────────────────────
async function runQwenPhase(tasks, numWorkers) {
    const results = new Array(tasks.length);
    let nextIndex = 0;
    let completed = 0;
    const startTime = Date.now();

    async function worker(wId) {
        while (nextIndex < tasks.length) {
            const i = nextIndex++;
            try {
                results[i] = await tasks[i]();
                completed++;
                if (completed % 10 === 0 || completed === tasks.length) {
                    const elapsed = ((Date.now() - startTime) / 1000).toFixed(0);
                    console.log(`  [Qwen] ${completed}/${tasks.length} (${elapsed}s)`);
                }
            } catch (err) {
                results[i] = { error: err.message, selectedTables: null };
                completed++;
            }
        }
    }

    const workers = [];
    for (let w = 0; w < numWorkers; w++) workers.push(worker(w));
    await Promise.all(workers);
    return results;
}

// ─── Phase 2: DeepSeek Validation ────────────────────────────────────────
async function runDeepSeekPhase(tasks, numWorkers) {
    const results = new Array(tasks.length);
    let nextIndex = 0;
    let completed = 0;
    const startTime = Date.now();
    const stats = { perfect: 0, good: 0, partial: 0, bad: 0, error: 0 };

    async function worker(wId) {
        while (nextIndex < tasks.length) {
            const i = nextIndex++;
            try {
                const result = await tasks[i]();
                results[i] = result;
                completed++;
                const q = result.quality || 'error';
                stats[q] = (stats[q] || 0) + 1;
                if (completed % 20 === 0 || completed === tasks.length) {
                    const elapsed = ((Date.now() - startTime) / 1000).toFixed(0);
                    console.log(`  [DeepSeek] ${completed}/${tasks.length} (${elapsed}s) | ✅${stats.perfect} 👍${stats.good} ⚠️${stats.partial} ❌${stats.bad} 🔥${stats.error}`);
                }
            } catch (err) {
                results[i] = { error: err.message, quality: "error" };
                completed++;
                stats.error++;
            }
        }
    }

    const workers = [];
    for (let w = 0; w < numWorkers; w++) workers.push(worker(w));
    await Promise.all(workers);
    return { results, stats };
}

// ─── Main ────────────────────────────────────────────────────────────────
async function main() {
    console.log('=== Full Pipeline Schema Linking Validation ===');
    console.log(`Qwen workers: ${QWEN_WORKERS} | DeepSeek workers: ${DEEPSEEK_WORKERS} | MAX_TABLES: ${MAX_TABLES}`);

    const testData = JSON.parse(fs.readFileSync(TEST_FILE, 'utf-8'));
    const sls = new SchemaLinkingService();
    console.log(`Loaded ${testData.length} test samples\n`);

    // ─── Classify samples ────────────────────────────────────────
    const smallSchemas = [];  // ≤ MAX_TABLES → skip
    const needsAI = [];       // > MAX_TABLES → run AI selection

    for (let i = 0; i < testData.length; i++) {
        const sample = testData[i];
        const allTables = sls.getSchemaTableNames(sample.db_id);
        if (allTables.length <= MAX_TABLES) {
            smallSchemas.push({ index: i, ...sample, allTables, selectedTables: new Set(allTables) });
        } else {
            const linking = sls.generateLinkingWithRelevantTables(sample.question, sample.db_id);
            const rawSchema = sls.getRawSchema(sample.db_id);
            needsAI.push({
                index: i,
                ...sample,
                allTables,
                linking,
                rawSchema,
                selectedTables: null  // will be filled by Qwen
            });
        }
    }

    console.log(`Small schemas (skip): ${smallSchemas.length}`);
    console.log(`Need AI selection: ${needsAI.length}\n`);

    // ─── Phase 1: Qwen AI Schema Selection ───────────────────────
    console.log('=== Phase 1: Qwen Schema Selection via Request-Hub ===');
    const qwenTasks = needsAI.map(entry => async () => {
        const tableList = buildTableListForPrompt(entry.rawSchema);
        const response = await callQwenSchemaSelection(
            entry.question, tableList, entry.linking.linkingText
        );
        const selected = parseTableList(response, entry.allTables);

        // Merge with token-matched tables
        if (entry.linking.relevantTables) {
            for (const t of entry.linking.relevantTables) selected.add(t);
        }

        // Cap at MAX_TABLES
        if (selected.size > MAX_TABLES) {
            const capped = new Set();
            for (const t of selected) {
                if (capped.size >= MAX_TABLES) break;
                capped.add(t);
            }
            entry.selectedTables = capped;
        } else {
            entry.selectedTables = selected.size > 0 ? selected : new Set(entry.allTables);
        }

        return { selectedCount: entry.selectedTables.size, totalCount: entry.allTables.length };
    });

    const qwenResults = await runQwenPhase(qwenTasks, QWEN_WORKERS);
    console.log(`\nQwen phase complete. ${qwenResults.filter(r => r && !r.error).length}/${needsAI.length} successful\n`);

    // ─── Phase 2: DeepSeek Validation (only for AI-selected ones) ─
    console.log('=== Phase 2: DeepSeek Validation ===');
    const deepseekTasks = needsAI.map(entry => async () => {
        if (!entry.selectedTables || entry.selectedTables.size === 0) {
            return { quality: "error", reason: "No tables selected" };
        }
        const result = await callDeepSeekValidation(
            entry.question, entry.query, entry.selectedTables, entry.allTables
        );
        result.selectedCount = entry.selectedTables.size;
        result.totalCount = entry.allTables.length;
        result.selectedTables = [...entry.selectedTables];
        return result;
    });

    const { results: deepseekResults, stats } = await runDeepSeekPhase(deepseekTasks, DEEPSEEK_WORKERS);

    // ─── Combine results ─────────────────────────────────────────
    const allResults = [];
    for (const entry of smallSchemas) {
        allResults.push({
            index: entry.index,
            dbId: entry.db_id,
            question: entry.question.substring(0, 100),
            quality: "skipped",
            reason: `Schema ≤ ${MAX_TABLES} tables`,
            selectedCount: entry.allTables.length,
            totalCount: entry.allTables.length
        });
    }
    for (let i = 0; i < needsAI.length; i++) {
        allResults.push({
            index: needsAI[i].index,
            dbId: needsAI[i].db_id,
            question: needsAI[i].question.substring(0, 100),
            ...(deepseekResults[i] || { quality: "error" })
        });
    }

    // Sort by index
    allResults.sort((a, b) => a.index - b.index);

    // ─── Save & Print ────────────────────────────────────────────
    fs.mkdirSync(path.dirname(OUTPUT_FILE), { recursive: true });
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify({
        timestamp: new Date().toISOString(),
        config: { QWEN_WORKERS, DEEPSEEK_WORKERS, MAX_TABLES },
        total: testData.length,
        skipped: smallSchemas.length,
        ai_selected: needsAI.length,
        stats,
        results: allResults
    }, null, 2));

    // Coverage = perfect + good + skipped
    const coverage = stats.perfect + stats.good + smallSchemas.length;

    console.log(`\n=== FINAL RESULTS ===`);
    console.log(`Total: ${testData.length}`);
    console.log(`Skipped (schema ≤ ${MAX_TABLES}): ${smallSchemas.length}`);
    console.log(`AI Selected: ${needsAI.length}`);
    console.log(`  ✅ Perfect: ${stats.perfect}`);
    console.log(`  👍 Good: ${stats.good}`);
    console.log(`  ⚠️ Partial: ${stats.partial}`);
    console.log(`  ❌ Bad: ${stats.bad}`);
    console.log(`  🔥 Error: ${stats.error}`);
    console.log(`\nCoverage (perfect+good+skipped): ${coverage}/${testData.length} = ${(coverage / testData.length * 100).toFixed(1)}%`);
    console.log(`\nSaved to: ${OUTPUT_FILE}`);

    // Show failures
    const failures = allResults.filter(r => r.quality === 'bad' || r.quality === 'partial');
    if (failures.length > 0) {
        console.log(`\n=== ISSUES (${failures.length}) ===`);
        for (const f of failures.slice(0, 15)) {
            console.log(`[${f.index}] ${f.quality.toUpperCase()} | ${f.dbId}: ${f.question}`);
            if (f.missing_tables?.length) console.log(`  Missing: ${f.missing_tables.join(', ')}`);
            console.log(`  Selected: ${f.selectedCount}/${f.totalCount}`);
        }
    }
}

main().catch(err => {
    console.error('Fatal error:', err);
    process.exit(1);
});
