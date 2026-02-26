
const aiService = require('./aiService');
const prompts = require('../prompts');
const promptsRetry = require('../prompts_retry');

class PlanningService {

    /**
     * Generates a query plan based on the user's question and the schema context.
     * @param {string} question - The user's question
     * @param {string} schemaContext - The text representation of the schema
     * @returns {string} - The query plan as raw text (bullet points)
     */
    async generatePlan(question, schemaContext) {
        const currentDateTime = new Date().toISOString();

        // --- Attempt 1: Original prompt ---
        try {
            let prompt = prompts.PLANNING_PROMPT_TEMPLATE;
            prompt = prompt.replace('{{question}}', question);
            prompt = prompt.replace('{{schema_context}}', schemaContext);
            prompt = prompt.replace('{{current_datetime}}', currentDateTime);

            const messages = [
                { role: 'system', content: 'You are an expert SQL analyst. Respond with short bullet points.' },
                { role: 'user', content: prompt }
            ];

            console.log("[PlanningService] Generating plan...");
            const textResponse = await aiService.generateJson(messages, true);
            return textResponse;

        } catch (error) {
            console.warn("[PlanningService] Original prompt failed, retrying with compact prompt...", error.message);
        }

        // --- Attempt 2: Retry with compact prompt ---
        try {
            let prompt = promptsRetry.PLANNING_PROMPT_TEMPLATE;
            prompt = prompt.replace('{{question}}', question);
            prompt = prompt.replace('{{schema_context}}', schemaContext);
            prompt = prompt.replace('{{current_datetime}}', currentDateTime);

            const messages = [
                { role: 'system', content: 'You are an expert SQL analyst. Be concise.' },
                { role: 'user', content: prompt }
            ];

            console.log("[PlanningService] RETRY: Generating plan with compact prompt...");
            const textResponse = await aiService.generateJson(messages, true);
            return textResponse;

        } catch (retryError) {
            console.error("[PlanningService] Retry also failed:", retryError.message);
            throw new Error("Failed to generate query plan from AI (both attempts failed).");
        }
    }
}

module.exports = new PlanningService();
