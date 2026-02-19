const fs = require('fs');
const path = require('path');
const axios = require('axios');
const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const { evaluateSQL } = require('./services/deepseek');
const Database = require('better-sqlite3');

// Server Setup
const app = express();
const server = http.createServer(app);
const io = new Server(server);
const PORT = 3001;

app.use(express.json()); // Add json body parser
app.use(express.static(path.join(__dirname, 'public')));

// Configuration
const TENSOR_SQL_ENDPOINT = process.env.TENSOR_SQL_ENDPOINT || 'http://localhost:3005/api/text2sql/generate';
const DATA_DIR = path.resolve(__dirname, '../data/syllable-level');
const SQLITE_DB_DIR = path.resolve(__dirname, '../data/syllable-level/databases');
const TABLES_FILE = path.join(DATA_DIR, 'tables.json');
const TEST_FILE = path.join(DATA_DIR, 'test.json');
const TEST_GOLD_FILE = path.join(DATA_DIR, 'test_gold.sql');
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

    // Filter only top-level clauses (parenDepth === 0)
    let topLevelMatches = [];
    let parenDepth = 0;
    let matchIdx = 0;

    for (let i = 0; i < sql.length; i++) {
        const char = sql[i];
        if (char === '(') {
            parenDepth++;
        } else if (char === ')') {
            parenDepth--;
        }

        // Check if the current character position matches the start of a keyword
        // and if we haven't processed all matches yet.
        if (matchIdx < matches.length && i === matches[matchIdx].index) {
            // Check if the keyword is at the top level (not inside parentheses)
            if (parenDepth === 0) {
                topLevelMatches.push(matches[matchIdx]);
            }
            // Advance the character index past the current keyword to avoid re-matching
            // parts of the same keyword or overlapping keywords.
            // Note: This assumes keywords don't overlap in a way that would cause issues.
            // The `i += ... - 1` is because the loop's `i++` will increment it by one more.
            i += matches[matchIdx].clause.length - 1;
            matchIdx++;
        }
    }

    for (let i = 0; i < topLevelMatches.length; i++) {
        const current = topLevelMatches[i];
        let next = topLevelMatches[i + 1];

        const start = current.index + current.clause.length;
        const end = next ? next.index : sql.length;

        let content = sql.substring(start, end).trim();
        parts[current.clause] = content;
    }

    return parts;
}

function analyzeDiff(genSql, goldSql) {
    const genParts = extractSQLClauses(genSql);
    const goldParts = extractSQLClauses(goldSql);
    const allKeys = new Set([...Object.keys(genParts), ...Object.keys(goldParts)]);
    const diffs = [];

    allKeys.forEach(key => {
        const genVal = genParts[key] || "(missing)";
        const goldVal = goldParts[key] || "(missing)";
        if (genVal !== goldVal) {
            diffs.push({ clause: key.toUpperCase(), gen: genVal, gold: goldVal });
        }
    });
    return diffs;
}

// Execution-based Evaluation Logic (Extracted)
function evaluateExecution(genSql, goldSql, dbId, rawSchema = null) {
    if (!genSql || !goldSql || !dbId) {
        return { error: 'Missing genSql, goldSql, or dbId' };
    }

    // Attempt to resolve rawSchema from global map if not provided
    if (!rawSchema && schemasMap) {
        rawSchema = schemasMap[dbId];
    }

    const dbPath = path.join(SQLITE_DB_DIR, `${dbId}.sqlite`);
    if (!fs.existsSync(dbPath)) {
        return { error: `Database ${dbId} not found` };
    }

    let db;
    try {
        db = new Database(dbPath, { readonly: true, timeout: 5000 });

        // Remove schema prefixes (dbo., public.) which are invalid in SQLite but common in generated SQL
        const removeSchemaPrefix = (s) => s ? s.replace(/\b(dbo|public)\./gi, '') : s;

        // No normalization needed as schema and gold SQL are already complete
        let normalizedGenSql = genSql;
        let normalizedGoldSql = goldSql;


        const runQuery = (sql) => {
            try {
                // Pre-normalize quotes if not already done (for fallback path)
                const sqlToInit = sql.replace(/"/g, "'");

                // Get results in row format (array of arrays)
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
            return {
                match: false,
                reason: 'Execution Error',
                genError: resGen.error,
                goldError: resGold.error,
                normalizedGenSql,
                normalizedGoldSql
            };
        }

        // Logic:
        // 1. Cut header
        // 2. Reorder columns based on first 5 records
        const normalizeResults = (queryResult) => {
            const { columns, rows } = queryResult;
            if (rows.length === 0) return { headers: columns, data: [] };

            // For each column index, generate a basis string for sorting
            const colBasis = columns.map((colName, colIdx) => {
                const sampleValues = rows.slice(0, 5).map(row => String(row[colIdx]));
                return {
                    originalIdx: colIdx,
                    basis: sampleValues.join('|')
                };
            });

            // Sort column indices based on basis string
            colBasis.sort((a, b) => a.basis.localeCompare(b.basis));

            const sortedIndices = colBasis.map(item => item.originalIdx);

            // Reorder headers and data rows
            const sortedHeaders = sortedIndices.map(idx => columns[idx]);
            const sortedData = rows.map(row => sortedIndices.map(idx => row[idx]));

            return { headers: sortedHeaders, data: sortedData, colBasis: colBasis };
        };

        const normGen = normalizeResults(resGen);
        const normGold = normalizeResults(resGold);

        // 3. 1:1 comparison
        const compareData = (data1, data2) => {
            if (data1.length !== data2.length) return false;
            for (let i = 0; i < data1.length; i++) {
                if (data1[i].length !== data2[i].length) return false;
                for (let j = 0; j < data1[i].length; j++) {
                    if (String(data1[i][j]) !== String(data2[i][j])) return false;
                }
            }
            return true;
        };

        const isMatch = compareData(normGen.data, normGold.data);

        return {
            match: isMatch,
            reason: isMatch ? 'Match' : 'Mismatch',
            genResult: normGen,
            goldResult: normGold,
            normalizedGenSql,
            normalizedGoldSql
        };

    } catch (err) {
        return { error: err.message };
    } finally {
        if (db) db.close();
    }
}

// Execution-based Evaluation Endpoint
app.post('/api/evaluate-execution', (req, res) => {
    const { genSql, goldSql, dbId } = req.body;
    const rawSchema = schemasMap ? schemasMap[dbId] : null;
    const result = evaluateExecution(genSql, goldSql, dbId, rawSchema);

    if (result.error) {
        if (result.error === 'Missing genSql, goldSql, or dbId') return res.status(400).json({ status: 'error', message: result.error });
        if (result.error.includes('not found')) return res.status(404).json({ status: 'error', message: result.error });
        return res.status(500).json({ status: 'error', message: result.error });
    }

    return res.json({
        status: 'success',
        ...result
    });
});

// Simple Execution Endpoint for Remote Execution (from TensorSQL-Node)
app.post('/api/execute-sql', (req, res) => {
    const { sql, dbId } = req.body;
    if (!sql || !dbId) return res.status(400).json({ error: 'Missing sql or dbId' });

    const dbPath = path.join(SQLITE_DB_DIR, `${dbId}.sqlite`);
    if (!fs.existsSync(dbPath)) return res.status(404).json({ error: `Database ${dbId} not found` });

    let db;
    try {
        db = new Database(dbPath, { readonly: true, timeout: 5000 });
        const stmt = db.prepare(sql);

        // We only need to check for execution errors. 
        // We don't need the full result set, but it's helpful for debugging.
        // Limit returned rows to avoid large payloads.
        const rows = stmt.all();
        const columns = stmt.columns().map(c => c.name);

        return res.json({ columns, rows: rows.slice(0, 50) });

    } catch (err) {
        return res.status(400).json({ error: err.message });
    } finally {
        if (db) db.close();
    }
});

// Load data
console.log(`[Bootstrap] Loading data from ${DATA_DIR}...`);
const tablesData = JSON.parse(fs.readFileSync(TABLES_FILE, 'utf8'));
const testData = JSON.parse(fs.readFileSync(TEST_FILE, 'utf8'));
const goldData = fs.readFileSync(TEST_GOLD_FILE, 'utf8').split('\n').filter(line => line.trim());

// Index schemas by db_id for quick lookup
const schemasMap = {};
tablesData.forEach(schema => {
    schemasMap[schema.db_id] = schema;
});

// Global State for Persistence
let isRunning = false;
let globalStats = {
    total: 0,
    processed: 0,
    strict: 0,
    loose: 0,
    success: 0,
    fail: 0,
    skipped: 0,
    totalScore: 0
};
let recentResults = [];

async function processTests(customStartIndex, customEndIndex, enableAI = true, concurrency = 1, evalMode = 'execution') {
    if (isRunning) return;
    isRunning = true;

    // Use custom indices if provided, otherwise fallback to env/defaults
    const startIdx = (customStartIndex !== undefined) ? customStartIndex : START_INDEX;
    const endIdx = (customEndIndex !== undefined) ? customEndIndex : END_INDEX;

    // Reset Global Stats for new run
    globalStats = {
        total: Math.max(0, Math.min(testData.length, endIdx) - startIdx),
        processed: 0,
        strict: 0,
        loose: 0,
        success: 0,
        fail: 0,
        skipped: 0,
        totalScore: 0
    };
    recentResults = [];

    // Ensure logs directory exists
    const logsDir = path.dirname(LOG_FILE);
    if (!fs.existsSync(logsDir)) {
        fs.mkdirSync(logsDir, { recursive: true });
    }

    // Initialize text log (overwrite or create new)
    fs.writeFileSync(TEXT_LOG_FILE, `--- Benchmark Started at ${new Date().toISOString()} (Mode: ${evalMode}) ---\n`);

    console.log(`[Bootstrap] Found ${testData.length} test cases.`);
    console.log(`[Bootstrap] Found ${goldData.length} gold records.`);

    const effectiveEnd = Math.min(testData.length, endIdx);

    // Load existing results for caching/resuming
    let results = [];
    const resultsMap = new Map();
    if (fs.existsSync(LOG_FILE)) {
        try {
            const existingData = JSON.parse(fs.readFileSync(LOG_FILE, 'utf8'));
            if (Array.isArray(existingData)) {
                results = existingData;
                results.forEach(r => resultsMap.set(r.id, r));
                console.log(`[Bootstrap] Loaded ${results.length} existing results for caching.`);
            }
        } catch (err) {
            console.error(`[Bootstrap] Error loading existing results: ${err.message}`);
        }
    }

    console.log(`[Bootstrap] Running tests from index ${startIdx} to ${effectiveEnd - 1} with mode: ${evalMode}`);

    io.emit('benchmark_start', { total: globalStats.total, startIndex: startIdx, endIndex: effectiveEnd });

    // --- Schema Warmup Phase ---
    const uniqueDbIds = new Set();
    for (let i = startIdx; i < effectiveEnd; i++) {
        // Skip warmup if we already have the result for this index
        if (resultsMap.has(i)) continue;

        const testCase = testData[i];
        if (testCase && testCase.db_id) {
            uniqueDbIds.add(testCase.db_id);
        }
    }

    console.log(`[Bootstrap] Found ${uniqueDbIds.size} unique schemas to warmup (excluding cached).`);
    io.emit('benchmark_status', { message: `Warming up ${uniqueDbIds.size} schemas...` });

    const warmupConcurrency = concurrency; // Use configured concurrency for warmup
    // const warmupConcurrency = 5; // Previous default (was too low)
    const dbIdsArray = Array.from(uniqueDbIds);

    // Process warmup with worker pool pattern
    let warmupIndex = 0;
    const processWarmupItem = async (workerId) => {
        while (warmupIndex < dbIdsArray.length && isRunning) {
            const currentIndex = warmupIndex++;
            const dbId = dbIdsArray[currentIndex];
            if (!dbId) break;

            const rawSchema = schemasMap[dbId];
            if (!rawSchema) continue;

            const schemaPayload = normalizeSchema(rawSchema);
            const payload = {
                question: "Warmup",
                schema: schemaPayload, // Keep original question (with accents)
                onlyEnrich: true,
                workerId: workerId // Pass real worker ID
            };

            try {
                // console.log(`[Bootstrap] [Worker ${workerId}] Warming up schema: ${dbId}`);
                await axios.post(TENSOR_SQL_ENDPOINT, payload);
            } catch (err) {
                console.error(`[Bootstrap] [Worker ${workerId}] Warmup failed for ${dbId}:`, err.message);
            }

            if ((currentIndex + 1) % 20 === 0) {
                console.log(`[Bootstrap] Warmed up ${currentIndex + 1}/${dbIdsArray.length} schemas.`);
            }
        }
    };

    const warmupWorkers = [];
    for (let i = 0; i < warmupConcurrency; i++) {
        warmupWorkers.push(processWarmupItem(i));
    }
    await Promise.all(warmupWorkers);
    console.log(`[Bootstrap] Schema warmup completed.`);

    // Worker function to process a single test case
    const processSingleTest = async (i, workerId) => {
        if (!isRunning) return;

        // Check Cache
        if (resultsMap.has(i)) {
            const cached = resultsMap.get(i);
            console.log(`[Bootstrap] [Worker ${workerId}] [${i + 1}/${effectiveEnd}] Using CACHED result for DB: ${cached.db_id}`);

            // Update Stats
            globalStats.processed++;
            if (cached.error) {
                globalStats.fail++;
            } else {
                globalStats.success++;
                if (cached.strict_match) globalStats.strict++;
                if (cached.loose_match) globalStats.loose++;
                globalStats.totalScore += (cached.score || 0);

                // For skipped (errors in gold/execution that were skipped logic? No, results file stores final outcome)
                // If the logic in evaluateExecution returned "Skipped", it sets reason but maybe not error?
                // Let's stick to strict/loose/score from file.
            }

            // Emit to UI
            io.emit('test_update', {
                index: cached.id,
                question: cached.question,
                isStrict: cached.strict_match,
                isLoose: cached.loose_match,
                dbId: cached.db_id,
                duration: cached.duration_ms || 0,
                score: cached.score,
                reason: cached.reason || (cached.error ? cached.error : "Cached")
            });
            return;
        }

        const testCase = testData[i];
        const dbId = testCase.db_id;
        const rawSchema = schemasMap[dbId];

        if (!rawSchema) {
            console.error(`[Bootstrap] [Worker ${workerId}] Schema not found for db_id: ${dbId}`);
            return;
        }

        const schemaPayload = normalizeSchema(rawSchema);

        // Get Gold SQL (format: SQL \t db_id)
        const goldLine = goldData[i] || "";
        const goldSQL = goldLine.split('\t')[0];

        const payload = {
            question: testCase.question, // Keep original question (with accents)
            schema: schemaPayload,
            dbId: dbId, // Pass dbId for remote execution
            execute: false, // By default, TensorSQL-Node won't execute unless needed, but we can enable it
            workerId: workerId // Pass worker ID for logging
        };

        try {
            // Note: process.stdout.write might interleave when running in parallel, but it's acceptable for now
            // or we can switch to console.log which is atomic per line
            // process.stdout.write(`[Bootstrap] [${i + 1}/${effectiveEnd}] DB: ${dbId} ... `);

            const start = Date.now();
            const response = await axios.post(TENSOR_SQL_ENDPOINT, payload);
            const duration = Date.now() - start;

            if (response.data.status === 'success') {
                const generatedSQL = response.data.sql || ""; // Adjust based on actual API response field

                console.log(`[Bootstrap] [Worker ${workerId}] [${i + 1}/${effectiveEnd}] DB: ${dbId} | Evaluating (Mode: ${evalMode})...`);

                let isMatch = false;
                let isLooseMatch = false;
                let score = 0;
                let reason = "";
                let eaResult = { match: null, reason: "Skipped (AI Mode)" };

                if (evalMode === 'execution') {
                    // Execution Match Mode
                    eaResult = evaluateExecution(generatedSQL, goldSQL, dbId, rawSchema);
                    isMatch = eaResult.match;
                    isLooseMatch = isMatch; // Typically execution match is strict
                    reason = eaResult.reason || (isMatch ? "Execution Match" : "Execution Mismatch");

                    if (eaResult.error) {
                        reason = `Execution Error: ${eaResult.error}`;
                    }

                    // Optional: Still run AI score for data collection if enabled?
                    if (enableAI) {
                        try {
                            const aiResult = await evaluateSQL(generatedSQL, goldSQL);
                            score = aiResult.score;
                            // Append AI reason if useful
                            // reason += ` | AI Score: ${score}`; 
                        } catch (e) {
                            console.error(`[Bootstrap] AI Eval failed in execution mode:`, e.message);
                        }
                    }

                } else {
                    // AI Score Match Mode (>= 95)
                    const aiResult = await evaluateSQL(generatedSQL, goldSQL);
                    score = aiResult.score;
                    reason = aiResult.reason;

                    isMatch = score >= 95;
                    isLooseMatch = isMatch;
                }

                console.log(`[Bootstrap] [${i + 1}/${effectiveEnd}] Success (${duration}ms) | Strict: ${isMatch} | Reason: ${reason}`);

                if (isLooseMatch) globalStats.loose++;
                if (isMatch) {
                    globalStats.strict++;
                }
                globalStats.success++;
                globalStats.processed++;
                globalStats.totalScore += (score || 0);

                const logEntry = `[${i}] DB: ${dbId} | Strict: ${isMatch} | Loose: ${isLooseMatch}\n` +
                    `   Q: ${testCase.question}\n` +
                    `   GEN:  ${generatedSQL}\n` +
                    `   GOLD: ${goldSQL}\n` +
                    `   SCORE: ${score} | REASON: ${reason}\n` +
                    `---------------------------------------\n`;
                fs.appendFileSync(TEXT_LOG_FILE, logEntry);

                const resultData = {
                    index: i,
                    question: testCase.question,
                    isStrict: isMatch,
                    isLoose: isLooseMatch,
                    dbId: dbId,
                    duration: duration,
                    score: score,
                    reason: reason
                };

                // Update recent results queue
                recentResults.unshift(resultData);
                if (recentResults.length > 10) recentResults.pop();

                // Live Update
                io.emit('test_update', resultData);

                results.push({
                    id: i,
                    db_id: dbId,
                    question: testCase.question,
                    gold_sql: goldSQL,
                    generated_sql: generatedSQL,
                    strict_match: isMatch,
                    loose_match: isLooseMatch,
                    score: score,
                    reason: reason,
                    duration_ms: duration,
                    ea_result: eaResult
                });

                // Save incrementally
                fs.writeFileSync(LOG_FILE, JSON.stringify(results, null, 2));
            } else {
                console.log(`[Bootstrap] [${i + 1}/${effectiveEnd}] Failed`);
                console.error(`   -> Response:`, response.data);
                globalStats.fail++;
                globalStats.processed++;

                const logEntry = `[${i}] DB: ${dbId} | API FAIL\n` +
                    `   Q: ${testCase.question}\n` +
                    `   ERR: API returned status ${response.data.status}\n` +
                    `---------------------------------------\n`;
                fs.appendFileSync(TEXT_LOG_FILE, logEntry);

                results.push({ id: i, db_id: dbId, question: testCase.question, error: "API Error", details: response.data });

                // Save incrementally
                fs.writeFileSync(LOG_FILE, JSON.stringify(results, null, 2));
            }
        } catch (error) {
            console.log(`[Bootstrap] [${i + 1}/${effectiveEnd}] Error`);
            console.error(`   -> Message: ${error.message}`);
            if (error.response) {
                console.error(`      Data:`, error.response.data);
            }
            globalStats.fail++;
            globalStats.processed++;

            const errEntry = `[${i}] DB: ${dbId} | ERROR\n   Q: ${testCase.question}\n   ERR: ${error.message}\n---------------------------------------\n`;
            fs.appendFileSync(TEXT_LOG_FILE, errEntry);

            const errorData = {
                index: i,
                question: testCase.question,
                isStrict: false,
                isLoose: false,
                error: error.message
            };

            // Should error results be shown in queue? Yes.
            recentResults.unshift(errorData);
            if (recentResults.length > 10) recentResults.pop();

            io.emit('test_update', errorData);

            results.push({ id: i, db_id: dbId, question: testCase.question, error: error.message });

            // Save incrementally
            fs.writeFileSync(LOG_FILE, JSON.stringify(results, null, 2));
        }
    };

    // Create a queue of indices to process
    const queue = [];
    for (let i = startIdx; i < effectiveEnd; i++) {
        queue.push(i);
    }

    // Worker loop
    const worker = async (workerId) => {
        while (queue.length > 0 && isRunning) {
            const idx = queue.shift();
            await processSingleTest(idx, workerId);
        }
    };

    // Start workers
    const numWorkers = Math.max(1, Math.min(concurrency, queue.length));
    console.log(`[Bootstrap] Starting ${numWorkers} worker(s)...`);

    const workers = [];
    for (let w = 0; w < numWorkers; w++) {
        workers.push(worker(w)); // Pass worker index (0-based)
    }

    await Promise.all(workers);

    const summaryHeader = `\n--- Benchmark Summary ---\n`;
    const summaryStats = `Total Cases: ${globalStats.total}\n` +
        `Processed:   ${globalStats.processed}\n` +
        `Success Gen: ${globalStats.success}\n` +
        `Failed Gen:  ${globalStats.fail}\n` +
        `Skipped (Gold Err): ${globalStats.skipped}\n` +
        `Strict Matches:  ${globalStats.strict} (${((globalStats.strict / (globalStats.processed - globalStats.skipped)) * 100).toFixed(2)}% of valid)\n` +
        `Loose Matches:   ${globalStats.loose} (${((globalStats.loose / (globalStats.processed - globalStats.skipped)) * 100).toFixed(2)}% of valid)\n` +
        `--------------------------\n`;

    fs.appendFileSync(TEXT_LOG_FILE, summaryHeader + summaryStats);

    console.log(`[Bootstrap] Completed ${globalStats.processed} tests.`);
    console.log(`   Success Generation: ${globalStats.success}`);
    console.log(`   Failed Generation:  ${globalStats.fail}`);
    console.log(`   Skipped (Gold Err): ${globalStats.skipped}`);
    console.log(`   Strict Matches:     ${globalStats.strict}`);
    console.log(`   Loose Matches:      ${globalStats.loose}`);

    // Check for division by zero (exclude skipped from denominator)
    const validCount = globalStats.processed - globalStats.skipped;
    const strictAcc = validCount > 0 ? ((globalStats.strict / validCount) * 100).toFixed(2) : "0.00";
    const looseAcc = validCount > 0 ? ((globalStats.loose / validCount) * 100).toFixed(2) : "0.00";
    console.log(`   Strict Accuracy:    ${strictAcc}%`);
    console.log(`   Loose Accuracy:     ${looseAcc}%`);

    fs.writeFileSync(LOG_FILE, JSON.stringify(results, null, 2));
    console.log(`[Bootstrap] Detailed results saved to ${LOG_FILE}`);

    io.emit('benchmark_finished', {
        total: globalStats.processed,
        strict: globalStats.strict,
        loose: globalStats.loose,
        accuracy: strictAcc,
        totalScore: globalStats.totalScore
    });

    isRunning = false;
}

io.on('connection', (socket) => {
    console.log('[Bootstrap] Browser connected');

    // Send current state to new client
    // If running or if we have results from a previous run
    if (isRunning || globalStats.processed > 0) {
        socket.emit('benchmark_restore', {
            isRunning: isRunning,
            total: globalStats.total,
            processed: globalStats.processed,
            strict: globalStats.strict,
            skipped: globalStats.skipped,
            loose: globalStats.loose,
            recentResults: recentResults,
            totalScore: globalStats.totalScore
        });
    }

    socket.on('start_benchmark', (data) => {
        console.log('[Bootstrap] Start trigger received:', data);
        processTests(data.start, data.end, data.enableAI, data.concurrency, data.evalMode).catch(console.error);
    });
});

server.listen(PORT, () => {
    console.log(`[Bootstrap] Dashboard available at http://localhost:${PORT}`);
    console.log(`[Bootstrap] Awaiting trigger from web interface...`);
});

function normalizeSchema(rawSchema) {
    // ViText2SQL schema format:
    // We use "table_names" and "column_names" which contain unaccented names
    // to match the database schema and guide the AI toward unaccented SQL.

    // We need to reconstruct the table-column structure.

    const normalizedTables = [];

    // table_names is array of strings. 
    // column_names is array of [table_index, column_name]
    // column_types is array of strings corresponding to column_names indices
    // primary_keys is array of column indices
    // foreign_keys is array of [col_idx, col_idx]

    rawSchema.table_names.forEach((tableName, idx) => {
        normalizedTables.push({
            index: idx,
            name: tableName, // Use normalized Table Name
            columns: []
        });
    });

    rawSchema.column_names.forEach((col, colIdx) => {
        const tableIdx = col[0];
        const colName = col[1];
        const colType = rawSchema.column_types[colIdx];

        // tableIdx -1 usually means "*" (all), often associated with no specific table or all tables.
        // But we can skip or assign to a dummy table?
        // TensorSQL schema structure usually has strictly typed tables.

        if (tableIdx === -1) {
            // Skip "*" column for schema definition (it's not a physical column)
            return;
        }

        if (normalizedTables[tableIdx]) {
            normalizedTables[tableIdx].columns.push({
                name: colName, // Use normalized Column Name
                dataType: colType,
                isPrimaryKey: rawSchema.primary_keys.includes(colIdx),
                isForeignKey: false // simplistic check, foreign_keys array check is more complex
            });
        }
    });

    // Construct Schema Payload
    return {
        tables: normalizedTables.map(t => ({
            name: t.name,
            columns: t.columns
        }))
    };
}
