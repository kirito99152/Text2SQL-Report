const fs = require('fs');
const path = require('path');
const https = require('https');

const DEEPSEEK_API_KEY = 'sk-ebb998207ef747faad709dd7491e2351';
const DEEPSEEK_ENDPOINT = 'api.deepseek.com';

const CONCURRENCY = 8; // Faster

function evaluateSQL(generatedSQL, goldSQL) {
    const fullPrompt = `
You are a strict SQL semantic equivalence evaluator for SQLite.
Your task: Determine if two SQL queries will return EXACTLY the same results on any possible database state.

CRITICAL RULES:
1. IGNORE COSMETIC DIFFERENCES (aliases, case, whitespace, order in SELECT).
2. FOCUS ON SEMANTIC DIFFERENCES (JOIN logic, WHERE conditions, aggregation, GROUP BY, HAVING).
3. COMMON EQUIVALENT PATTERNS (COUNT(*)=COUNT(1), JOIN=COMMA-WHERE, etc).
4. Vietnamese COLUMN/TABLE NAMES (accented = unaccented).
5. Vietnamese-English VALUE EQUIVALENCE (e.g., 'Spouse' = 'Vợ/Chồng').
6. CRITICAL EVALUATION PRINCIPLES (Lenient with cosmetic and translation differences).

Generated SQL:
\`\`\`sql
${generatedSQL}
\`\`\`

Gold SQL:
\`\`\`sql
${goldSQL}
\`\`\`

Analyze and return ONLY a valid JSON object:
{
    "strict_match": boolean,
    "score": number,
    "reason": "Brief explanation"
}
`;

    return new Promise((resolve, reject) => {
        const postData = JSON.stringify({
            model: "deepseek-chat",
            messages: [
                { role: "system", content: "You are a helpful assistant that evaluates SQL queries. You output JSON only." },
                { role: "user", content: fullPrompt }
            ],
            temperature: 0.0,
            response_format: { type: "json_object" }
        });

        const options = {
            hostname: DEEPSEEK_ENDPOINT,
            path: '/chat/completions',
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${DEEPSEEK_API_KEY}`,
                'Content-Length': Buffer.byteLength(postData)
            },
            timeout: 30000
        };

        const req = https.request(options, (res) => {
            let body = '';
            res.on('data', (chunk) => body += chunk);
            res.on('end', () => {
                try {
                    const data = JSON.parse(body);
                    if (data.choices && data.choices[0] && data.choices[0].message) {
                        resolve(JSON.parse(data.choices[0].message.content));
                    } else {
                        resolve({ strict_match: false, score: 0, reason: "Invalid API response" });
                    }
                } catch (e) {
                    resolve({ strict_match: false, score: 0, reason: "Parse Error" });
                }
            });
        });

        req.on('error', (e) => resolve({ strict_match: false, score: 0, reason: "Network Error" }));
        req.write(postData);
        req.end();
    });
}

async function main() {
    const resultsPath = path.join(__dirname, 'logs/benchmark_results.json');
    const outputPath = path.join(__dirname, 'logs/benchmark_results.json');

    if (!fs.existsSync(resultsPath)) {
        console.error("Results file not found:", resultsPath);
        return;
    }

    const results = JSON.parse(fs.readFileSync(resultsPath, 'utf8'));
    const targetIndices = results.map((item, idx) => ({ item, idx })).filter(x => x.item.score < 95);

    console.log(`Loaded ${results.length} items. Processing ${targetIndices.length} items with score < 95...`);

    let updatedCount = 0;
    let finishedCount = 0;

    async function worker() {
        while (targetIndices.length > 0) {
            const { item, idx } = targetIndices.shift();

            try {
                const evalResult = await evaluateSQL(item.generated_sql, item.gold_sql);

                if (evalResult.strict_match !== item.strict_match || Math.abs(evalResult.score - item.score) >= 1) {
                    results[idx].strict_match = evalResult.strict_match;
                    results[idx].score = evalResult.score;
                    results[idx].reason = evalResult.reason;
                    updatedCount++;
                }
            } catch (err) { }

            finishedCount++;
            if (finishedCount % 20 === 0 || finishedCount === 1) {
                console.log(`Progress: ${finishedCount}/${targetIndices.length + finishedCount} (Updated: ${updatedCount})`);
            }
        }
    }

    const workers = Array(CONCURRENCY).fill(0).map(() => worker());
    await Promise.all(workers);

    fs.writeFileSync(outputPath, JSON.stringify(results, null, 2), 'utf8');
    console.log(`Done. Updated ${updatedCount} items. Saved to ${outputPath}`);
}

main();
