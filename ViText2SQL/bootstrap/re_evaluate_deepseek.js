const fs = require('fs');
const path = require('path');
const { evaluateSQL } = require('./services/deepseek');

const CONCURRENCY = 8;

async function main() {
    const resultsPath = path.join(__dirname, '../benchDeepseek/logs/benchmark_results.json');

    if (!fs.existsSync(resultsPath)) {
        console.error("Results file not found:", resultsPath);
        return;
    }

    const results = JSON.parse(fs.readFileSync(resultsPath, 'utf8'));
    console.log(`Loaded ${results.length} items.`);

    // Build work queue: only items with score < 95
    const workQueue = [];
    results.forEach((item, idx) => {
        if (item.score < 95) {
            workQueue.push({ item, idx });
        }
    });

    console.log(`Processing ${workQueue.length} items with score < 95...`);

    let updatedCount = 0;
    let finishedCount = 0;
    let queueIdx = 0;

    async function worker() {
        while (true) {
            const myIdx = queueIdx++;
            if (myIdx >= workQueue.length) break;

            const { item, idx } = workQueue[myIdx];

            try {
                const evalResult = await evaluateSQL(item.generated_sql, item.gold_sql);

                if (evalResult.strict_match !== item.strict_match || Math.abs(evalResult.score - item.score) >= 1) {
                    results[idx].score = evalResult.score;
                    results[idx].reason = evalResult.reason;
                    // strict_match = true if score >= 95
                    results[idx].strict_match = evalResult.score >= 95 ? true : evalResult.strict_match;
                    updatedCount++;
                }
            } catch (err) {
                console.error(`Error ID ${item.id}:`, err.message);
            }

            finishedCount++;
            if (finishedCount % 20 === 0 || finishedCount === 1) {
                console.log(`Progress: ${finishedCount}/${workQueue.length} (Updated: ${updatedCount})`);
            }
        }
    }

    const workers = Array(CONCURRENCY).fill(0).map(() => worker());
    await Promise.all(workers);

    fs.writeFileSync(resultsPath, JSON.stringify(results, null, 2), 'utf8');
    console.log(`\nDone. Updated ${updatedCount}/${workQueue.length} items. Saved to ${resultsPath}`);
}

main();
