
const aiService = require('./aiService');
const prompts = require('../prompts');

class SqlService {

    /**
     * Generates the SQL query based on the plan and schema context.
     * @param {Object} plan - The query plan JSON
     * @param {string} schemaContext - The text representation of the schema
     * @returns {string} - The generated SQL query
     */
    async generateSql(plan, schemaContext) {
        const currentDateTime = new Date().toISOString();

        // Plan is now text, so we use it directly. 
        // If it happens to be an object (legacy), we stringify it.
        const planString = typeof plan === 'string' ? plan : JSON.stringify(plan, null, 2);

        let prompt = prompts.GENERATE_SQL_PROMPT_TEMPLATE;
        prompt = prompt.replace('{{schema_context}}', schemaContext);
        prompt = prompt.replace('{{query_plan}}', planString);
        prompt = prompt.replace('{{current_datetime}}', currentDateTime);

        const messages = [
            { role: 'system', content: 'You are an expert SQL developer for Microsoft SQL Server. Generate ONLY the raw SQL query. No markdown, no explanation.' },
            { role: 'user', content: prompt }
        ];

        try {
            console.log("[SqlService] Generating SQL...");
            // Disable thinking for SQL generation
            const sqlResponse = await aiService.generateJson(messages, false);

            // Clean up: remove thinking tags or code blocks if present
            // Qwen thinking mode might include <think>...</think> tags which need removal?
            // Or if it returns standard markdown.
            // The prompt says "Return ONLY the raw SQL... No markdown".
            // But models are chatty. Let's be safe.

            return this.cleanSql(sqlResponse);

        } catch (error) {
            console.error("[SqlService] Error generating SQL:", error);
            throw new Error("Failed to generate SQL from AI.");
        }
    }

    cleanSql(text) {
        // Remove markdown code blocks
        let cleaned = text.replace(/```sql/g, '').replace(/```/g, '').trim();

        // Remove <think> blocks if present (DeepSeek/Qwen thinking output)
        // Regex: <think> ... </think> (dotall)
        cleaned = cleaned.replace(/<think>[\s\S]*?<\/think>/g, '').trim();

        return cleaned;
    }
}

module.exports = new SqlService();
