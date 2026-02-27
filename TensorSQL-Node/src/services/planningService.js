
const aiService = require('./aiService');
const { getPrompts } = require('../promptsResolver');

class PlanningService {

    /**
     * Generates a query plan based on the user's question and the schema context.
     * @param {string} question - The user's question
     * @param {string} schemaContext - The text representation of the schema
     * @returns {string} - The query plan as raw text (bullet points)
     */
    async generatePlan(question, schemaContext, pipeline = 'base') {
        const currentDateTime = new Date().toISOString();
        const prompts = getPrompts(pipeline);

        try {
            let prompt = prompts.PLANNING_PROMPT_TEMPLATE;
            prompt = prompt.replace('{{question}}', question);
            prompt = prompt.replace('{{schema_context}}', schemaContext);
            prompt = prompt.replace('{{current_datetime}}', currentDateTime);

            const messages = [
                { role: 'system', content: 'You are an expert SQL analyst. Respond with short bullet points.' },
                { role: 'user', content: prompt }
            ];

            console.log(`[PlanningService] Generating plan (pipeline: ${pipeline})...`);
            const textResponse = await aiService.generateJson(messages, true);
            return textResponse;

        } catch (error) {
            console.error("[PlanningService] Generation failed:", error.message);
            throw new Error("Failed to generate query plan from AI.");
        }
    }
}

module.exports = new PlanningService();
