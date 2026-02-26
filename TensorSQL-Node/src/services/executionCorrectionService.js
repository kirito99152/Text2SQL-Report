const executionService = require('./executionService');
const aiService = require('./aiService');
const selfCheckService = require('./selfCheckService');
const prompts = require('../prompts');
const promptsRetry = require('../prompts_retry');

class ExecutionCorrectionService {

    /**
     * Executes the SQL and attempts to correct it if it fails.
     * @param {string} dbId - The database ID
     * @param {string} sql - The initial SQL query
     * @param {string} question - The user question
     * @param {string} schemaContext - The schema context
     * @param {string} plan - The query plan
     * @returns {Promise<string>} - The valid (or corrected) SQL
     */
    async executeAndCorrect(dbId, sql, question, schemaContext, plan) {
        if (!dbId) return sql;

        console.log(`[ExecutionCorrection] Validating SQL execution for DB: ${dbId}...`);
        const planString = typeof plan === 'string' ? plan : JSON.stringify(plan, null, 2);

        // Try up to 1 retry for now
        for (let attempt = 0; attempt < 2; attempt++) {
            try {
                // Attempt execution
                await executionService.executeQuery(dbId, sql);
                console.log("[ExecutionCorrection] SQL executed successfully.");
                return sql; // Success!

            } catch (execError) {
                console.warn(`[ExecutionCorrection] SQL Execution Failed (Attempt ${attempt + 1}): ${execError.message}`);

                if (attempt === 0) {
                    console.log("[ExecutionCorrection] Attempting to fix SQL based on execution error...");

                    // --- Try original prompt first ---
                    let fixedSql = await this._tryFixWithPrompt(
                        prompts.SQL_EXECUTION_ERROR_PROMPT,
                        schemaContext, question, planString, sql, execError.message,
                        "Original"
                    );

                    // --- If original failed, retry with compact prompt ---
                    if (!fixedSql) {
                        fixedSql = await this._tryFixWithPrompt(
                            promptsRetry.SQL_EXECUTION_ERROR_PROMPT,
                            schemaContext, question, planString, sql, execError.message,
                            "Retry (compact)"
                        );
                    }

                    if (fixedSql) {
                        sql = fixedSql;
                        // Loop continues to attempt 2 to verify the fix
                    } else {
                        console.warn("[ExecutionCorrection] Both fix attempts failed. Keeping current SQL.");
                        break;
                    }
                }
            }
        }
        return sql;
    }

    /**
     * Attempt to fix SQL using a given prompt template.
     * @returns {string|null} - Fixed SQL or null if failed
     */
    async _tryFixWithPrompt(promptTemplate, schemaContext, question, planString, sql, errorMessage, label) {
        try {
            let prompt = promptTemplate;
            prompt = prompt.replace('{{schema_context}}', schemaContext);
            prompt = prompt.replace('{{question}}', question);
            prompt = prompt.replace('{{query_plan}}', planString);
            prompt = prompt.replace('{{generated_sql}}', sql);
            prompt = prompt.replace('{{error_message}}', errorMessage);

            const messages = [
                { role: 'system', content: 'You are a SQLite SQL debugger. Output corrected SQL only.' },
                { role: 'user', content: prompt }
            ];

            console.log(`[ExecutionCorrection] ${label}: Calling AI to fix SQL...`);
            const fixedSqlResponse = await aiService.generateJson(messages, false);
            const fixedSql = selfCheckService.cleanResponse(fixedSqlResponse);

            if (fixedSql && fixedSql.length > 5) {
                console.log(`[ExecutionCorrection] ${label}: SQL Fixed: ${fixedSql}`);
                return fixedSql;
            } else {
                console.warn(`[ExecutionCorrection] ${label}: Fix returned invalid SQL.`);
                return null;
            }
        } catch (aiError) {
            console.warn(`[ExecutionCorrection] ${label}: AI call failed: ${aiError.message}`);
            return null;
        }
    }
}

module.exports = new ExecutionCorrectionService();
