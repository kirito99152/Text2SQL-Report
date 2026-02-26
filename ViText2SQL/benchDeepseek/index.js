const fs = require('fs');
const path = require('path');
const axios = require('axios');
const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const { generateSQL, evaluateSQL } = require('./services/deepseek');
const Database = require('better-sqlite3');

// Server Setup
const app = express();
const server = http.createServer(app);
const io = new Server(server);
const PORT = process.env.PORT || 3002;

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Configuration
const DATA_DIR = path.resolve(__dirname, '../data/syllable-level');
const SQLITE_DB_DIR = path.resolve(__dirname, '../data/syllable-level/databases');
const TABLES_FILE = path.join(DATA_DIR, 'tables.json');
const TEST_FILE = path.join(DATA_DIR, 'dev.json');

const LOG_FILE = path.join(__dirname, 'logs', 'benchmark_results.json');
const TEXT_LOG_FILE = path.join(__dirname, 'logs', 'benchmark.log');

// Range Selection
const START_INDEX = parseInt(process.env.START_INDEX || '0', 10);
const END_INDEX = parseInt(process.env.END_INDEX || '2000', 10);

// Helper to extract clauses for detailed comparison
function extractSQLClauses(sql) {
    const clauses = ['select', 'from', 'where', 'group by', 'having', 'order by', 'limit', 'intersect', 'union', 'except'];
    const parts = {};
    let lowerSql = sql.toLowerCase();
    let matches = [];

    clauses.forEach(clause => {
        const regex = new RegExp(`\\b${clause}\\b`, 'g');
        let match;
        while ((match = regex.exec(lowerSql)) !== null) {
            matches.push({ clause: clause, index: match.index });
        }
    });

    matches.sort((a, b) => a.index - b.index);
    let topLevelMatches = [];
    let parenDepth = 0;
    let matchIdx = 0;

    for (let i = 0; i < sql.length; i++) {
        const char = sql[i];
        if (char === '(') parenDepth++;
        else if (char === ')') parenDepth--;

        if (matchIdx < matches.length && i === matches[matchIdx].index) {
            if (parenDepth === 0) topLevelMatches.push(matches[matchIdx]);
            i += matches[matchIdx].clause.length - 1;
            matchIdx++;
        }
    }

    for (let i = 0; i < topLevelMatches.length; i++) {
        const current = topLevelMatches[i];
        let next = topLevelMatches[i + 1];
        const start = current.index + current.clause.length;
        const end = next ? next.index : sql.length;
        parts[current.clause] = sql.substring(start, end).trim();
    }
    return parts;
}

// Execution-based Evaluation Logic
function evaluateExecution(genSql, goldSql, dbId, rawSchema = null) {
    if (!genSql || !goldSql || !dbId) return { error: 'Missing genSql, goldSql, or dbId' };

    const dbPath = path.join(SQLITE_DB_DIR, `${dbId}.sqlite`);
    if (!fs.existsSync(dbPath)) return { error: `Database ${dbId} not found` };

    let db;
    try {
        db = new Database(dbPath, { readonly: true, timeout: 5000 });
        const removeSchemaPrefix = (s) => s ? s.replace(/\b(dbo|public)\./gi, '') : s;

        let normalizedGenSql = removeSchemaPrefix(genSql);
        let normalizedGoldSql = removeSchemaPrefix(goldSql);

        const runQuery = (sql) => {
            try {
                const sqlToInit = sql.replace(/"/g, "'");
                const stmt = db.prepare(sqlToInit);
                const columns = stmt.columns().map(c => c.name);
                const rows = stmt.raw().all();
                return { columns, rows };
            } catch (err) {
                return { error: err.message };
            }
        };

        const resGen = runQuery(normalizedGenSql);
        const resGold = runQuery(normalizedGoldSql);

        if (resGen.error || resGold.error) {
            return { match: false, reason: 'Execution Error', genError: resGen.error, goldError: resGold.error, normalizedGenSql, normalizedGoldSql };
        }

        const normalizeResults = (queryResult) => {
            const { columns, rows } = queryResult;
            if (rows.length === 0) return { headers: columns, data: [] };
            const colBasis = columns.map((colName, colIdx) => {
                const sampleValues = rows.slice(0, 5).map(row => String(row[colIdx]));
                return { originalIdx: colIdx, basis: sampleValues.join('|') };
            });
            colBasis.sort((a, b) => a.basis.localeCompare(b.basis));
            const sortedIndices = colBasis.map(item => item.originalIdx);
            return { headers: sortedIndices.map(idx => columns[idx]), data: rows.map(row => sortedIndices.map(idx => row[idx])) };
        };

        const normGen = normalizeResults(resGen);
        const normGold = normalizeResults(resGold);

        const compareData = (data1, data2) => {
            if (data1.length !== data2.length) return false;
            return data1.every((row, i) => row.length === data2[i].length && row.every((val, j) => String(val) === String(data2[i][j])));
        };

        const isMatch = compareData(normGen.data, normGold.data);
        return { match: isMatch, reason: isMatch ? 'Match' : 'Mismatch', normalizedGenSql, normalizedGoldSql, goldError: resGold.error, goldRows: normGold.data.length };
    } catch (err) {
        return { error: err.message };
    } finally {
        if (db) db.close();
    }
}

// Load data
console.log(`[DeepSeek Bench] Loading data...`);
const tablesData = JSON.parse(fs.readFileSync(TABLES_FILE, 'utf8'));
const testData = JSON.parse(fs.readFileSync(TEST_FILE, 'utf8'));
// const goldData = fs.readFileSync(TEST_GOLD_FILE, 'utf8').split('\n').filter(line => line.trim());

const schemasMap = {};
tablesData.forEach(schema => { schemasMap[schema.db_id] = schema; });

let isRunning = false;
let globalStats = { total: 0, processed: 0, strict: 0, loose: 0, success: 0, fail: 0, skipped: 0, totalScore: 0 };
let recentResults = [];

function getPromptSchemaContext(rawSchema) {
    let context = "";
    rawSchema.table_names.forEach((tableName, tIdx) => {
        context += `Table ${tableName}:\n`;
        rawSchema.column_names.forEach((col, cIdx) => {
            if (col[0] === tIdx) {
                const colName = col[1];
                const colType = rawSchema.column_types[cIdx];
                context += `  - ${colName} (${colType})\n`;
            }
        });
    });
    return context;
}

async function processTests(customStartIndex, customEndIndex, enableAI = true, concurrency = 1, evalMode = 'execution') {
    if (isRunning) return;
    isRunning = true;

    const startIdx = (customStartIndex !== undefined) ? customStartIndex : START_INDEX;
    const endIdx = (customEndIndex !== undefined) ? customEndIndex : END_INDEX;
    const effectiveEnd = Math.min(testData.length, endIdx);

    globalStats = { total: Math.max(0, effectiveEnd - startIdx), processed: 0, strict: 0, loose: 0, success: 0, fail: 0, skipped: 0, totalScore: 0 };
    recentResults = [];

    if (!fs.existsSync(path.dirname(LOG_FILE))) fs.mkdirSync(path.dirname(LOG_FILE), { recursive: true });
    fs.writeFileSync(TEXT_LOG_FILE, `--- DeepSeek Benchmark Started at ${new Date().toISOString()} (Mode: ${evalMode}) ---\n`);

    console.log(`[DeepSeek Bench] Running tests ${startIdx} to ${effectiveEnd - 1}`);
    io.emit('benchmark_start', { total: globalStats.total, startIndex: startIdx, endIndex: effectiveEnd });

    // Load existing results
    let results = [];
    const resultsMap = new Map();
    if (fs.existsSync(LOG_FILE)) {
        try {
            const existingData = JSON.parse(fs.readFileSync(LOG_FILE, 'utf8'));
            if (Array.isArray(existingData)) {
                results = existingData;
                results.forEach(r => {
                    const key = (r.id !== undefined) ? r.id : r.index;
                    if (key !== undefined) resultsMap.set(key, r);
                });
                console.log(`[DeepSeek Bench] Loaded ${results.length} existing results for caching.`);
            }
        } catch (err) {
            console.error(`[DeepSeek Bench] Error loading results: ${err.message}`);
        }
    }

    const processSingleTest = async (i) => {
        if (!isRunning) return;
        const testCase = testData[i];
        const dbId = testCase.db_id;
        const rawSchema = schemasMap[dbId];
        if (!rawSchema) return;

        const goldSQL = testCase.query; // Extract gold SQL directly from dev.json

        const schemaContext = getPromptSchemaContext(rawSchema);

        // Pre-check Gold SQL
        const goldCheck = evaluateExecution("", goldSQL, dbId, rawSchema);
        if (goldCheck.goldError || goldCheck.goldRows === 0) {
            console.warn(`[DeepSeek Bench] [${i + 1}/${effectiveEnd}] SKIPPED: ${goldCheck.goldError ? 'Gold Error' : 'Zero Rows'} in DB ${dbId}`);
            globalStats.skipped++;
            globalStats.processed++;
            io.emit('test_update', { index: i, question: testCase.question, isStrict: false, dbId, score: 0, reason: goldCheck.goldError ? "Skipped (Invalid Gold SQL)" : "Skipped (Zero Rows)" });
            return;
        }

        // Check availability in Cache
        if (resultsMap.has(i)) {
            const cached = resultsMap.get(i);
            const cachedDbId = cached.db_id || cached.dbId || 'unknown_db';
            const cachedIsStrict = cached.strict_match === true || cached.isStrict === true;
            console.log(`[DeepSeek Bench] [${i + 1}/${effectiveEnd}] Using CACHED result for DB: ${cachedDbId}`);

            globalStats.processed++;
            if (cachedIsStrict) globalStats.strict++;
            globalStats.success++;
            globalStats.totalScore += (cached.score || 0);

            io.emit('test_update', {
                index: i,
                question: cached.question,
                isStrict: cachedIsStrict,
                dbId: cachedDbId,
                score: cached.score,
                reason: cached.reason,
                duration: cached.duration || cached.duration_ms || 0
            });
            return;
        }

        try {
            const start = Date.now();
            const generatedSQL = await generateSQL(schemaContext, testCase.question);
            const duration = Date.now() - start;

            console.log(`[DeepSeek Bench] [${i + 1}/${effectiveEnd}] DB: ${dbId} | Generated. Mode: ${evalMode}`);

            let isMatch = false;
            let score = 0;
            let reason = "";
            let eaResult = { match: false, reason: "Skipped (AI Mode)" };

            if (evalMode === 'execution') {
                eaResult = evaluateExecution(generatedSQL, goldSQL, dbId, rawSchema);
                isMatch = eaResult.match;
                score = isMatch ? 100 : 0;
                reason = eaResult.reason || eaResult.error || "Unknown";

                if (enableAI) {
                    const aiResult = await evaluateSQL(generatedSQL, goldSQL);
                    score = aiResult.score;
                    reason = `EA: ${reason} | AI: ${aiResult.reason}`;
                }
            } else {
                // AI Score Mode
                const aiResult = await evaluateSQL(generatedSQL, goldSQL);
                score = aiResult.score;
                isMatch = score >= 95;
                reason = aiResult.reason;
            }

            console.log(`[DeepSeek Bench] [${i + 1}/${effectiveEnd}] Success (${duration}ms) | Strict: ${isMatch} | Score: ${score}`);

            if (isMatch) globalStats.strict++;
            globalStats.success++;
            globalStats.processed++;
            globalStats.totalScore += score;

            const logEntry = `[${i}] DB: ${dbId} | Match: ${isMatch}\n  Q: ${testCase.question}\n  GEN: ${generatedSQL}\n  GOLD: ${goldSQL}\n  SCORE: ${score} | REASON: ${reason}\n------------------\n`;
            fs.appendFileSync(TEXT_LOG_FILE, logEntry);

            const resultData = {
                id: i,
                db_id: dbId,
                question: testCase.question,
                gold_sql: goldSQL,
                generated_sql: generatedSQL,
                strict_match: isMatch,
                loose_match: score >= 95,
                score: score,
                reason: reason,
                duration_ms: duration,
                ea_result: {
                    match: eaResult.match,
                    reason: eaResult.reason || eaResult.error || (isMatch ? "Match" : "Mismatch"),
                    genError: eaResult.genError,
                    goldError: eaResult.goldError
                }
            };

            recentResults.unshift({
                index: i,
                question: testCase.question,
                isStrict: isMatch,
                dbId: dbId,
                score: score,
                reason: reason,
                duration: duration
            });
            if (recentResults.length > 10) recentResults.pop();
            io.emit('test_update', recentResults[0]);

            // Save to JSON
            results.push(resultData);
            fs.writeFileSync(LOG_FILE, JSON.stringify(results, null, 2));

        } catch (error) {
            console.error(`[DeepSeek Bench] [${i + 1}/${effectiveEnd}] Error: ${error.message}`);
            globalStats.fail++;
            globalStats.processed++;

            const errorResult = {
                id: i,
                db_id: dbId,
                question: testCase.question,
                error: error.message
            };

            io.emit('test_update', { index: i, question: testCase.question, isStrict: false, error: error.message });

            results.push(errorResult);
            fs.writeFileSync(LOG_FILE, JSON.stringify(results, null, 2));
        }
    };

    const queue = [];
    for (let i = startIdx; i < effectiveEnd; i++) queue.push(i);

    const worker = async () => {
        while (queue.length > 0 && isRunning) {
            await processSingleTest(queue.shift());
        }
    };

    const numWorkers = Math.max(1, Math.min(concurrency, queue.length));
    await Promise.all(Array(numWorkers).fill().map(() => worker()));

    isRunning = false;
    io.emit('benchmark_finished', { total: globalStats.processed, strict: globalStats.strict, accuracy: ((globalStats.strict / globalStats.processed) * 100).toFixed(2) });
}

io.on('connection', (socket) => {
    if (isRunning || globalStats.processed > 0) {
        socket.emit('benchmark_restore', { isRunning, total: globalStats.total, processed: globalStats.processed, strict: globalStats.strict, recentResults, totalScore: globalStats.totalScore });
    }
    socket.on('start_benchmark', (data) => processTests(data.start, data.end, data.enableAI, data.concurrency, data.evalMode).catch(console.error));
});

server.listen(PORT, () => {
    console.log(`[DeepSeek Bench] Dashboard at http://localhost:${PORT}`);
    if (process.env.AUTO_START === 'true') {
        console.log(`[DeepSeek Bench] AUTO_START detected, starting benchmark...`);
        processTests().catch(err => {
            console.error(`[DeepSeek Bench] Benchmark failed: ${err.message}`);
            process.exit(1);
        });
    }
});
