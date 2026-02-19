const executionService = require('./executionService');
const aiService = require('./aiService');
const selfCheckService = require('./selfCheckService');
const prompts = require('../prompts');

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

                    // Prepare Correction Prompt
                    let prompt = prompts.SQL_EXECUTION_ERROR_PROMPT;
                    prompt = prompt.replace('{{schema_context}}', schemaContext);
                    prompt = prompt.replace('{{question}}', question);
                    // plan is text in Qwen3-8B flow
                    const planString = typeof plan === 'string' ? plan : JSON.stringify(plan, null, 2);
                    prompt = prompt.replace('{{query_plan}}', planString);
                    prompt = prompt.replace('{{generated_sql}}', sql);
                    prompt = prompt.replace('{{error_message}}', execError.message);

                    const messages = [
                        { role: 'system', content: 'You are a SQLite SQL debugger. Output VALID or the corrected SQL only.' },
                        { role: 'user', content: prompt }
                    ];

                    try {
                        const fixedSqlResponse = await aiService.generateJson(messages, false); // No thinking for quick fix?

                        // Clean response
                        const fixedSql = selfCheckService.cleanResponse(fixedSqlResponse);

                        if (fixedSql && fixedSql.length > 5) {
                            console.log(`[ExecutionCorrection] SQL Fixed: ${fixedSql}`);
                            sql = fixedSql;
                            // Loop continues to attempt 2 to verify the fix
                        } else {
                            console.warn("[ExecutionCorrection] Fix failed to return valid SQL. Keeping original.");
                            break; // Stop if fix is invalid
                        }
                    } catch (aiError) {
                        console.error("[ExecutionCorrection] AI Correction Failed:", aiError.message);
                        break;
                    }
                }
            }
        }
        return sql;
    }
}

module.exports = new ExecutionCorrectionService();
