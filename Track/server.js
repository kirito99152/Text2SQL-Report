const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3005;
const LOGS_DIR = process.env.LOGS_DIR || path.join(__dirname, '../ViText2SQL/benchmark_tensor_logs');

app.use(cors());
app.use(express.json());

app.get('/api/stats', (req, res) => {
    try {
        if (!fs.existsSync(LOGS_DIR)) {
            return res.json({ pipelines: {} });
        }

        const files = fs.readdirSync(LOGS_DIR).filter(f => f.startsWith('benchmark_results_') && f.endsWith('.json'));
        const pipelines = {};

        files.forEach(file => {
            const pipelineName = file.replace('benchmark_results_', '').replace('.json', '');
            const filePath = path.join(LOGS_DIR, file);

            try {
                const rawData = fs.readFileSync(filePath, 'utf8').trim();
                if (!rawData) return;

                const data = JSON.parse(rawData);
                const total = data.length;
                const correct = data.filter(item => item.exact_match === true).length;
                const percentage = total > 0 ? ((correct / total) * 100).toFixed(2) : "0.00";

                pipelines[pipelineName] = {
                    total,
                    correct,
                    percentage,
                    results: data.slice(-10).reverse()
                };
            } catch (e) {
                console.error(`Error parsing ${file}:`, e);
            }
        });

        res.json({ pipelines });
    } catch (error) {
        console.error('Error reading logs directory:', error);
        res.status(500).json({ error: 'Failed to read benchmark results' });
    }
});

// Serve frontend if dist exists
const distPath = path.join(__dirname, 'dist');
if (fs.existsSync(distPath)) {
    app.use(express.static(distPath));
    app.get('*', (req, res) => {
        // Only serve index.html for non-API routes
        if (!req.path.startsWith('/api')) {
            res.sendFile(path.join(distPath, 'index.html'));
        }
    });
}

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
