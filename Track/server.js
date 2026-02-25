const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3005;
const RESULTS_PATH = process.env.RESULTS_PATH || path.join(__dirname, '../ViText2SQL/benchmark_tensor_logs/benchmark_results.json');

app.use(cors());
app.use(express.json());

app.get('/api/stats', (req, res) => {
    try {
        if (!fs.existsSync(RESULTS_PATH)) {
            return res.json({
                total: 0,
                correct: 0,
                percentage: "0.00",
                results: []
            });
        }

        const rawData = fs.readFileSync(RESULTS_PATH, 'utf8').trim();
        if (!rawData) {
            return res.json({
                total: 0,
                correct: 0,
                percentage: "0.00",
                results: []
            });
        }

        let data;
        try {
            data = JSON.parse(rawData);
        } catch (e) {
            console.error('JSON Parse error, returning empty stats:', e);
            return res.json({
                total: 0,
                correct: 0,
                percentage: "0.00",
                results: []
            });
        }

        const total = data.length;
        const correct = data.filter(item => item.exact_match === true).length;
        const percentage = total > 0 ? ((correct / total) * 100).toFixed(2) : "0.00";

        // Return stats and the last 10 results for the "recent" table
        res.json({
            total,
            correct,
            percentage,
            results: data.slice(-10).reverse()
        });
    } catch (error) {
        console.error('Error reading results:', error);
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
