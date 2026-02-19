const axios = require('axios');

class ExecutionService {
    constructor() {
        // Default to the docker-compose service name if env is missing
        // This endpoint logic depends on bootstrap/index.js exposing /api/execute-sql
        this.bootstrapUrl = process.env.BOOTSTRAP_ENDPOINT || 'http://vitext2sql:3001/api/execute-sql';
    }

    /**
     * Executes the generated SQL query against the target database via remote execution API.
     * @param {string} dbId - The database ID (REQUIRED for remote execution)
     * @param {string} query - The SQL query to execute
     * @returns {Object} - The execution result (rows, columns)
     * @throws {Error} - If execution fails
     */
    async executeQuery(dbId, query) {
        if (!dbId) {
            throw new Error("dbId is required for execution.");
        }

        try {
            // console.log(`[ExecutionService] Sending SQL to ${this.bootstrapUrl} for DB: ${dbId}`);

            const response = await axios.post(this.bootstrapUrl, {
                sql: query,
                dbId: dbId
            });

            return {
                rows: response.data.rows,
                columns: response.data.columns
            };

        } catch (error) {
            // Handle Axios errors
            const errorMessage = error.response?.data?.error || error.message;
            // console.error("[ExecutionService] Remote execution failed:", errorMessage);
            throw new Error(errorMessage);
        }
    }
}

module.exports = new ExecutionService();
