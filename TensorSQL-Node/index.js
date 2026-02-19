
require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const routes = require('./src/routes');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;
const ERROR_LOG_FILE = path.join(__dirname, 'logs', 'server_error.log');

// Ensure logs directory exists
const logsDir = path.dirname(ERROR_LOG_FILE);
if (!fs.existsSync(logsDir)) {
    fs.mkdirSync(logsDir, { recursive: true });
}

function logError(err, context) {
    const timestamp = new Date().toISOString();
    const message = `[${timestamp}] ${context}: ${err.stack || err}\n`;
    console.error(message.trim());
    try {
        fs.appendFileSync(ERROR_LOG_FILE, message);
    } catch (e) {
        console.error("Failed to write to log file:", e);
    }
}

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Logging middleware
app.use((req, res, next) => {
    console.log(`[${new Date().toISOString()}] ${req.method} ${req.url}`);
    next();
});

// Routes
app.use('/api/text2sql', routes);

// Error handling middleware
app.use((err, req, res, next) => {
    logError(err, '[Global Error Handler]');
    res.status(500).send('Something broke!');
});

// Catch unhandled rejections and exceptions
process.on('unhandledRejection', (reason, promise) => {
    logError(reason, `Unhandled Rejection at: ${promise}`);
});
process.on('uncaughtException', (err) => {
    logError(err, 'Uncaught Exception thrown');
    process.exit(1);
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
    console.log(`Endpoint: http://localhost:${PORT}/api/text2sql/generate`);
});
