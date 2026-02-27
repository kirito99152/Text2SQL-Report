
const aiService = require('./aiService');
const { getPrompts } = require('../promptsResolver');

class SqlService {

    /**
     * Generates the SQL query based on the plan and schema context.
     * @param {Object} plan - The query plan JSON
     * @param {string} schemaContext - The text representation of the schema
     * @returns {string} - The generated SQL query
     */
    async generateSql(plan, schemaContext, question, pipeline = 'base') {
        const currentDateTime = new Date().toISOString();
        const planString = plan ? (typeof plan === 'string' ? plan : JSON.stringify(plan, null, 2)) : '';
        const prompts = getPrompts(pipeline);

        try {
            let prompt = prompts.GENERATE_SQL_PROMPT_TEMPLATE;
            prompt = prompt.replace('{{schema_context}}', schemaContext);
            if (plan) {
                prompt = prompt.replace('{{query_plan}}', planString);
            }
            if (question) {
                prompt = prompt.replace('{{question}}', question);
            }
            prompt = prompt.replace('{{current_datetime}}', currentDateTime);

            const messages = [
                { role: 'system', content: 'You are an expert SQL developer for SQLite. Generate ONLY the raw SQL query. No markdown, no explanation.' },
                { role: 'user', content: prompt }
            ];

            console.log(`[SqlService] Generating SQL (pipeline: ${pipeline})...`);
            const sqlResponse = await aiService.generateJson(messages, false);
            return this.cleanSql(sqlResponse);

        } catch (error) {
            console.error("[SqlService] Generation failed:", error.message);
            throw new Error("Failed to generate SQL from AI.");
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
