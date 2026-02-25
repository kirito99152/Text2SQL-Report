const express = require('express');
const cors = require('cors');
const axios = require('axios');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = process.env.PORT || 4000;

app.use(cors());
app.use(express.json({ limit: '50mb' }));
app.use(express.static(path.join(__dirname, 'public')));

// State
const queue = []; // Array of pending requests: { req, res, id, timestamp }
const endpoints = []; // Array of { url: string, status: 'idle' | 'busy', completed: number, currentTaskTime: number | null }
let requestIdCounter = 1;

const ENDPOINTS_FILE = path.join(__dirname, 'endpoints.json');

function saveEndpoints() {
    try {
        const data = endpoints.map(e => ({
            url: e.url,
            status: 'idle', // Always save as idle
            completed: e.completed || 0,
            currentTaskTime: null
        }));
        fs.writeFileSync(ENDPOINTS_FILE, JSON.stringify(data, null, 2));
        console.log(`[System] Endpoints saved to ${ENDPOINTS_FILE}`);
    } catch (error) {
        console.error(`[System] Failed to save endpoints: ${error.message}`);
    }
}

function loadEndpoints() {
    try {
        if (fs.existsSync(ENDPOINTS_FILE)) {
            const data = JSON.parse(fs.readFileSync(ENDPOINTS_FILE, 'utf8'));
            endpoints.length = 0; // Clear existing
            data.forEach(e => {
                endpoints.push({
                    url: e.url,
                    status: 'idle',
                    completed: e.completed || 0,
                    currentTaskTime: null
                });
            });
            console.log(`[System] Loaded ${endpoints.length} endpoints from ${ENDPOINTS_FILE}`);
        }
    } catch (error) {
        console.error(`[System] Failed to load endpoints: ${error.message}`);
    }
}

// Initial load
loadEndpoints();

function processQueue() {
    if (queue.length === 0) return;

    // Find first idle endpoint
    const idleEndpoint = endpoints.find(e => e.status === 'idle');
    if (!idleEndpoint) return; // No idle endpoints available

    // Take the oldest request
    const pendingRequest = queue.shift();

    // Assign to endpoint
    idleEndpoint.status = 'busy';
    idleEndpoint.currentTaskTime = Date.now();

    console.log(`[Queue] Assigning Request #${pendingRequest.id} to ${idleEndpoint.url}`);

    // Call the endpoint
    axios.post(idleEndpoint.url, pendingRequest.body, {
        headers: {
            'Content-Type': 'application/json',
            ...(pendingRequest.auth && { 'Authorization': pendingRequest.auth })
        },
        timeout: 0 // No timeout
    })
        .then(response => {
            console.log(`[Worker] ${idleEndpoint.url} completed Request #${pendingRequest.id}`);
            idleEndpoint.completed += 1;
            pendingRequest.res.json(response.data);
        })
        .catch(error => {
            console.error(`[Worker] ${idleEndpoint.url} failed Request #${pendingRequest.id}:`, error.message);
            pendingRequest.res.status(500).json({ error: "Upstream LLM Error", details: error.message });
        })
        .finally(() => {
            idleEndpoint.status = 'idle';
            idleEndpoint.currentTaskTime = null;
            // Try to process next item in queue immediately
            processQueue();
        });
}

// Main API to receive SQL Generation requests
app.post('/generate_output', (req, res) => {
    const id = requestIdCounter++;
    const authHeader = req.headers['authorization'];

    console.log(`[API] Received new request #${id}, adding to queue.`);

    queue.push({
        id: id,
        timestamp: Date.now(),
        body: req.body,
        res: res,
        auth: authHeader
    });

    // Try to process immediately if any worker is free
    processQueue();
});

// GUI APIs
app.get('/api/status', (req, res) => {
    res.json({
        queueLength: queue.length,
        endpoints: endpoints.map(e => ({
            ...e,
            busyTime: e.status === 'busy' && e.currentTaskTime ? (Date.now() - e.currentTaskTime) : 0
        }))
    });
});

app.post('/api/endpoints', (req, res) => {
    const { url } = req.body;
    if (!url) {
        return res.status(400).json({ error: "URL is required" });
    }

    const existing = endpoints.find(e => e.url === url);
    if (!existing) {
        endpoints.push({
            url: url,
            status: 'idle',
            completed: 0,
            currentTaskTime: null
        });
        console.log(`[System] Added new endpoint: ${url}`);
        saveEndpoints();
        // If there's a queue, it will immediately process because it's idle
        processQueue();
        return res.json({ success: true, message: "Added successfully" });
    }
    res.json({ success: true, message: "Already exists" });
});

app.delete('/api/endpoints', (req, res) => {
    const { url } = req.body;
    const index = endpoints.findIndex(e => e.url === url);
    if (index !== -1) {
        endpoints.splice(index, 1);
        console.log(`[System] Removed endpoint: ${url}`);
        saveEndpoints();
        return res.json({ success: true, message: "Removed successfully" });
    }
    res.status(404).json({ error: "Not found" });
});

app.listen(PORT, () => {
    console.log(`[Server] Request-Hub listening on http://localhost:${PORT}`);
});
