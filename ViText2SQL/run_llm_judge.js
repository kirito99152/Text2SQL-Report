const fs = require('fs');
const path = require('path');
const { Worker, isMainThread, parentPort, workerData } = require('worker_threads');
const { evaluateSQL } = require('./bootstrap/services/deepseek.js');

const RESULTS_FILE = path.join(__dirname, 'benchmark_tensor_logs', 'benchmark_results.json');
const OUTPUT_FILE = path.join(__dirname, 'benchmark_tensor_logs', 'llm_judge_results.json');
const NUM_WORKERS = 10; // Number of concurrent API requests

// We only evaluate those that failed Spider Exact Match to save cost/time,
// BUT for completeness, the user wants a full distribution report,
// so we'll run it on all that have valid generated SQL.
const EVAL_ALL = true;

async function runWorker() {
    const { items, workerId } = workerData;
    const results = [];

    for (let i = 0; i < items.length; i++) {
        const item = items[i];
        try {
            // Wait a little to avoid hitting rate limits too hard
            if (i > 0) await new Promise(r => setTimeout(r, 500));

            const evaluation = await evaluateSQL(item.generated_sql, item.gold_sql);

            results.push({
                id: item.id,
                db_id: item.db_id,
                strict_match: evaluation.strict_match,
                score: evaluation.score,
                reason: evaluation.reason
            });

            if ((i + 1) % 10 === 0) {
                parentPort.postMessage({ type: 'progress', workerId, progress: i + 1, total: items.length });
            }
        } catch (error) {
            results.push({
                id: item.id,
                db_id: item.db_id,
                strict_match: false,
                score: 0,
                reason: "Worker Error: " + error.message
            });
        }
    }

    parentPort.postMessage({ type: 'done', workerId, results });
}

async function main() {
    if (!fs.existsSync(RESULTS_FILE)) {
        console.error("Benchmark results not found!");
        return;
    }

    console.log("Loading benchmark results...");
    const data = JSON.parse(fs.readFileSync(RESULTS_FILE, 'utf-8'));

    // Determine which items to evaluate
    let itemsToProcess = data.filter(d => d.generated_sql && d.gold_sql);

    // Optional: Load previous progress to resume
    let existingResults = [];
    if (fs.existsSync(OUTPUT_FILE)) {
        existingResults = JSON.parse(fs.readFileSync(OUTPUT_FILE, 'utf-8'));
        const existingIds = new Set(existingResults.map(r => r.id));
        itemsToProcess = itemsToProcess.filter(d => !existingIds.has(d.id));
        console.log(`Resuming: Found ${existingResults.length} existing evaluated items.`);
    }

    if (itemsToProcess.length === 0) {
        console.log("All items already evaluated!");
        return;
    }

    console.log(`Starting LLM Judge evaluation for ${itemsToProcess.length} items using ${NUM_WORKERS} workers...`);

    // Chunking
    const chunkSize = Math.ceil(itemsToProcess.length / NUM_WORKERS);
    const chunks = [];
    for (let i = 0; i < NUM_WORKERS; i++) {
        const start = i * chunkSize;
        const chunk = itemsToProcess.slice(start, start + chunkSize);
        if (chunk.length > 0) chunks.push(chunk);
    }

    const allNewResults = [];
    let activeWorkers = chunks.length;

    chunks.forEach((chunk, i) => {
        const worker = new Worker(__filename, {
            workerData: { items: chunk, workerId: i }
        });

        worker.on('message', (msg) => {
            if (msg.type === 'progress') {
                console.log(`Worker ${msg.workerId} progress: ${msg.progress}/${msg.total}`);
            } else if (msg.type === 'done') {
                allNewResults.push(...msg.results);
                activeWorkers--;
                console.log(`Worker ${msg.workerId} finished.`);

                // Save incrementally
                const currentFinal = [...existingResults, ...allNewResults];
                fs.writeFileSync(OUTPUT_FILE, JSON.stringify(currentFinal, null, 2));

                if (activeWorkers === 0) {
                    console.log("All workers finished! Results saved to:", OUTPUT_FILE);
                    process.exit(0);
                }
            }
        });

        worker.on('error', (err) => {
            console.error(`Worker ${i} error:`, err);
            activeWorkers--;
        });

        worker.on('exit', (code) => {
            if (code !== 0) console.error(`Worker ${i} exited with code ${code}`);
        });
    });
}

if (isMainThread) {
    main();
} else {
    runWorker();
}
