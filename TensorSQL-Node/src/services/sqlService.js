
const aiService = require('./aiService');
const prompts = require('../prompts');
const promptsRetry = require('../prompts_retry');

class SqlService {

    /**
     * Generates the SQL query based on the plan and schema context.
     * @param {Object} plan - The query plan JSON
     * @param {string} schemaContext - The text representation of the schema
     * @returns {string} - The generated SQL query
     */
    async generateSql(plan, schemaContext) {
        const currentDateTime = new Date().toISOString();
        const planString = typeof plan === 'string' ? plan : JSON.stringify(plan, null, 2);

        // --- Attempt 1: Original prompt ---
        try {
            let prompt = prompts.GENERATE_SQL_PROMPT_TEMPLATE;
            prompt = prompt.replace('{{schema_context}}', schemaContext);
            prompt = prompt.replace('{{query_plan}}', planString);
            prompt = prompt.replace('{{current_datetime}}', currentDateTime);

            const messages = [
                { role: 'system', content: 'You are an expert SQL developer for SQLite. Generate ONLY the raw SQL query. No markdown, no explanation.' },
                { role: 'user', content: prompt }
            ];

            console.log("[SqlService] Generating SQL...");
            const sqlResponse = await aiService.generateJson(messages, false);
            return this.cleanSql(sqlResponse);

        } catch (error) {
            console.warn("[SqlService] Original prompt failed, retrying with compact prompt...", error.message);
        }

        // --- Attempt 2: Retry with compact prompt ---
        try {
            let prompt = promptsRetry.GENERATE_SQL_PROMPT_TEMPLATE;
            prompt = prompt.replace('{{schema_context}}', schemaContext);
            prompt = prompt.replace('{{query_plan}}', planString);
            prompt = prompt.replace('{{current_datetime}}', currentDateTime);

            const messages = [
                { role: 'system', content: 'You are an expert SQL developer for SQLite. Generate ONLY the raw SQL query.' },
                { role: 'user', content: prompt }
            ];

            console.log("[SqlService] RETRY: Generating SQL with compact prompt...");
            const sqlResponse = await aiService.generateJson(messages, false);
            return this.cleanSql(sqlResponse);

        } catch (retryError) {
            console.error("[SqlService] Retry also failed:", retryError.message);
            throw new Error("Failed to generate SQL from AI (both attempts failed).");
        }
    }

    cleanSql(text) {
        // Remove markdown code blocks
        let cleaned = text.replace(/```sql/gi, '').replace(/```/g, '').trim();

        // Remove <think> blocks if present (DeepSeek/Qwen thinking output)
        // Regex: <think> ... </think> (dotall)
        cleaned = cleaned.replace(/<think>[\s\S]*?<\/think>/g, '').trim();

        // Replace all newlines and multiple spaces with a single space
        cleaned = cleaned.replace(/\s+/g, ' ').trim();

        return cleaned;
    }
}

module.exports = new SqlService();
