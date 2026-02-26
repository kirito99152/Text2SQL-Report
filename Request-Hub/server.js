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
const queue = []; // Array of pending requests: { body, res, id, timestamp, retryCount, auth }
const endpoints = []; // Array of { url: string, status: 'idle' | 'busy' | 'down', completed: number, activeRequests: Array<{id, startTime}>, isHealthy: boolean, lastHealthCheck: number | null, maxConcurrent: number, currentRequests: number }
let requestIdCounter = 1;
const MAX_RETRIES = 3;

const ENDPOINTS_FILE = path.join(__dirname, 'endpoints.json');

function saveEndpoints() {
    try {
        const data = endpoints.map(e => ({
            url: e.url,
            status: e.status === 'down' ? 'down' : (e.currentRequests > 0 ? 'busy' : 'idle'),
            completed: e.completed || 0,
            activeRequests: [],
            isHealthy: e.isHealthy,
            maxConcurrent: e.maxConcurrent || 1
        }));
        fs.writeFileSync(ENDPOINTS_FILE, JSON.stringify(data, null, 2));
        console.log(`[System] Endpoints saved to ${ENDPOINTS_FILE}`);
    } catch (error) {
        console.error(`[System] Failed to save endpoints: ${error.message}`);
    }
}

function sortEndpoints() {
    // Sort endpoints: Healthy first, then lower load ratio, then fewer completed requests
    endpoints.sort((a, b) => {
        // 1. Healthy first
        if (a.isHealthy !== b.isHealthy) {
            return a.isHealthy ? -1 : 1;
        }
        // 2. Available capacity first (lower occupancy ratio)
        const aRatio = (a.currentRequests || 0) / (a.maxConcurrent || 1);
        const bRatio = (b.currentRequests || 0) / (b.maxConcurrent || 1);
        if (aRatio !== bRatio) {
            return aRatio - bRatio;
        }
        // 3. Fewer completed first (Load balancing)
        return (a.completed || 0) - (b.completed || 0);
    });
    console.log(`[System] Endpoints re-sorted.`);
}

function loadEndpoints() {
    try {
        if (fs.existsSync(ENDPOINTS_FILE)) {
            const data = JSON.parse(fs.readFileSync(ENDPOINTS_FILE, 'utf8'));
            endpoints.length = 0; // Clear existing
            data.forEach(e => {
                endpoints.push({
                    url: e.url,
                    status: e.status || 'idle',
                    completed: e.completed || 0,
                    activeRequests: [],
                    isHealthy: e.isHealthy !== undefined ? e.isHealthy : true,
                    lastHealthCheck: null,
                    maxConcurrent: e.maxConcurrent || 1,
                    currentRequests: 0
                });
            });
            console.log(`[System] Loaded ${endpoints.length} endpoints from ${ENDPOINTS_FILE}`);
            // Start initial health check
            runAllHealthChecks();
        }
    } catch (error) {
        console.error(`[System] Failed to load endpoints: ${error.message}`);
    }
}

async function checkEndpointHealth(endpoint) {
    try {
        // Simple Root Check: Just see if the server is alive
        // Any response (including 404) means the server is reachable and responsive.
        const baseUrl = new URL(endpoint.url).origin;
        await axios.get(baseUrl, { timeout: 5000 });

        endpoint.isHealthy = true;
        if (endpoint.status === 'down') endpoint.status = 'idle';
    } catch (error) {
        // If the server returns *any* response, it's alive!
        if (error.response) {
            endpoint.isHealthy = true;
            if (endpoint.status === 'down') endpoint.status = 'idle';
        } else if (error.code === 'ECONNREFUSED' || error.code === 'ENOTFOUND' || error.code === 'ETIMEDOUT' || error.message.includes('timeout')) {
            console.warn(`[HealthCheck] ${endpoint.url} is unreachable or timed out: ${error.message}`);
            endpoint.isHealthy = false;
            endpoint.status = 'down';
        } else {
            console.error(`[HealthCheck] Unexpected error checking ${endpoint.url}:`, error.message);
            endpoint.isHealthy = false;
            endpoint.status = 'down';
        }
    }
    endpoint.lastHealthCheck = Date.now();
}

async function runAllHealthChecks() {
    console.log(`[HealthCheck] Running periodic health checks for ${endpoints.length} endpoints...`);
    for (const endpoint of endpoints) {
        if (endpoint.status === 'busy') {
            // If it's busy, it's implicitly healthy. Just update the timestamp.
            endpoint.lastHealthCheck = Date.now();
            continue;
        }
        await checkEndpointHealth(endpoint);
    }

    sortEndpoints();
    saveEndpoints();

    console.log(`[HealthCheck] Health checks completed.`);
    processQueue(); // If any became healthy, start processing
}

// Initial load
loadEndpoints();

// Periodic health check every 30 seconds
setInterval(runAllHealthChecks, 30000);

function processQueue() {
    if (queue.length === 0) return;

    // Find endpoint with available capacity
    const availableEndpoint = endpoints.find(e => e.isHealthy && e.currentRequests < e.maxConcurrent);
    if (!availableEndpoint) return; // No available capacity

    // Take the oldest request
    const pendingRequest = queue.shift();

    // Assign to endpoint
    availableEndpoint.currentRequests = (availableEndpoint.currentRequests || 0) + 1;
    availableEndpoint.status = 'busy';

    const activeReq = { id: pendingRequest.id, startTime: Date.now() };
    availableEndpoint.activeRequests.push(activeReq);

    console.log(`[Queue] Assigning Request #${pendingRequest.id} (Retry: ${pendingRequest.retryCount || 0}) to ${availableEndpoint.url} (Load: ${availableEndpoint.currentRequests}/${availableEndpoint.maxConcurrent})`);

    // Call the endpoint
    axios.post(availableEndpoint.url, pendingRequest.body, {
        headers: {
            'Content-Type': 'application/json',
            ...(pendingRequest.auth && { 'Authorization': pendingRequest.auth })
        },
        timeout: 180000 // 180s timeout for AI generation
    })
        .then(response => {
            console.log(`[Worker] ${availableEndpoint.url} completed Request #${pendingRequest.id}`);
            availableEndpoint.completed += 1;
            pendingRequest.res.json(response.data);
        })
        .catch(async (error) => {
            console.error(`[Worker] ${availableEndpoint.url} failed Request #${pendingRequest.id}:`, error.message);

            // Immediate check health of this endpoint
            await checkEndpointHealth(availableEndpoint);

            // If it's down, re-sort immediately
            if (!availableEndpoint.isHealthy) {
                console.log(`[Failover] Endpoint ${availableEndpoint.url} detected as DOWN after error.`);
                sortEndpoints();
                saveEndpoints();
            }

            if (!availableEndpoint.isHealthy && (pendingRequest.retryCount || 0) < MAX_RETRIES) {
                console.log(`[Failover] Retrying request #${pendingRequest.id} on another worker.`);
                pendingRequest.retryCount = (pendingRequest.retryCount || 0) + 1;
                queue.unshift(pendingRequest); // Put back to front
                processQueue();
            } else {
                pendingRequest.res.status(500).json({
                    error: "Upstream LLM Error",
                    details: error.message,
                    endpoint: availableEndpoint.url,
                    isHealthy: availableEndpoint.isHealthy
                });
            }
        })
        .finally(() => {
            availableEndpoint.currentRequests = Math.max(0, (availableEndpoint.currentRequests || 1) - 1);

            // Remove from activeRequests
            const idx = availableEndpoint.activeRequests.findIndex(r => r.id === pendingRequest.id);
            if (idx !== -1) availableEndpoint.activeRequests.splice(idx, 1);

            if (availableEndpoint.currentRequests === 0 && availableEndpoint.status !== 'down') {
                availableEndpoint.status = 'idle';
            }
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
        auth: authHeader,
        retryCount: 0
    });

    // Try to process immediately if any worker is free
    processQueue();
});

// GUI APIs
app.get('/api/status', (req, res) => {
    res.json({
        queueLength: queue.length,
        endpoints: endpoints.map(e => ({
            url: e.url,
            status: e.status,
            isHealthy: e.isHealthy,
            completed: e.completed,
            lastHealthCheck: e.lastHealthCheck,
            maxConcurrent: e.maxConcurrent || 1,
            currentRequests: e.currentRequests || 0,
            activeRequests: e.activeRequests || []
        }))
    });
});

app.post('/api/healthcheck', async (req, res) => {
    console.log(`[System] Manual health check triggered.`);
    await runAllHealthChecks();
    res.json({ success: true, message: "Health checks completed and endpoints sorted." });
});

app.post('/api/endpoints', (req, res) => {
    const { url } = req.body;
    if (!url) {
        return res.status(400).json({ error: "URL is required" });
    }

    const existing = endpoints.find(e => e.url === url);
    if (!existing) {
        const newEndpoint = {
            url: url,
            status: 'idle',
            completed: 0,
            activeRequests: [],
            isHealthy: true,
            lastHealthCheck: null,
            maxConcurrent: req.body.maxConcurrent || 1,
            currentRequests: 0
        };
        endpoints.push(newEndpoint);
        console.log(`[System] Added new endpoint: ${url}`);
        checkEndpointHealth(newEndpoint).then(() => {
            saveEndpoints();
            processQueue();
        });
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
