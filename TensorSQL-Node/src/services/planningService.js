
const aiService = require('./aiService');
const prompts = require('../prompts');

class PlanningService {

    /**
     * Generates a query plan based on the user's question and the schema context.
     * @param {string} question - The user's question
     * @param {string} schemaContext - The text representation of the schema
     * @returns {string} - The query plan as raw text (bullet points)
     */
    async generatePlan(question, schemaContext) {
        const currentDateTime = new Date().toISOString(); // Or format as readable string

        let prompt = prompts.PLANNING_PROMPT_TEMPLATE;
        prompt = prompt.replace('{{question}}', question);
        prompt = prompt.replace('{{schema_context}}', schemaContext);
        prompt = prompt.replace('{{current_datetime}}', currentDateTime);

        const messages = [
            { role: 'system', content: 'You are an expert SQL analyst. Respond with short bullet points.' },
            { role: 'user', content: prompt }
        ];

        try {
            console.log("[PlanningService] Generating plan...");
            // Enable thinking for Planning
            const textResponse = await aiService.generateJson(messages, true);

            // Return raw text response directly
            return textResponse;

        } catch (error) {
            console.error("[PlanningService] Error generating plan:", error);
            throw new Error("Failed to generate query plan from AI.");
        }
    }
}

module.exports = new PlanningService();
