
const aiService = require('./aiService');
const prompts = require('../prompts');
const promptsRetry = require('../prompts_retry');

const MAX_TABLES = 10;

class SchemaSelectionService {

    /**
     * Use AI to select relevant tables from the full schema.
     * Combines token-matching hints with AI intelligence for accurate selection.
     * 
     * @param {string} question - The Vietnamese question
     * @param {Object} enrichedSchema - The enriched schema object with tables[]
     * @returns {Set<string>} - Set of relevant table names (max MAX_TABLES)
     */
    async selectRelevantTables(question, enrichedSchema) {
        const allTableNames = enrichedSchema.tables.map(t => t.name);

        // If schema is small enough, skip AI selection
        if (allTableNames.length <= MAX_TABLES) {
            console.log(`[SchemaSelection] Schema has ${allTableNames.length} tables (≤${MAX_TABLES}), using all.`);
            return new Set(allTableNames);
        }

        // Build table list with column info for AI context
        let tableList = "";
        for (const table of enrichedSchema.tables) {
            const cols = table.columns.map(c => c.name).join(', ');
            const desc = table.description ? ` — ${table.description}` : '';
            tableList += `- ${table.name} (${cols})${desc}\n`;
        }

        // Removed schema linking hints injection

        // --- Attempt 1: Original prompt ---
        try {
            let prompt = prompts.SCHEMA_SELECTION_PROMPT;
            prompt = prompt.replace('{{table_list}}', tableList);
            prompt = prompt.replace('{{question}}', question);

            const messages = [
                { role: 'system', content: 'You are a precise schema selector. Output ONLY a JSON array.' },
                { role: 'user', content: prompt }
            ];

            console.log(`[SchemaSelection] Asking AI to select from ${allTableNames.length} tables...`);
            const response = await aiService.generateJson(messages, false);
            const result = this._processSelectionResult(response, allTableNames);
            if (result) return result;

        } catch (error) {
            console.warn('[SchemaSelection] Original prompt failed, retrying with compact prompt...', error.message);
        }

        // --- Attempt 2: Retry with compact prompt ---
        try {
            let prompt = promptsRetry.SCHEMA_SELECTION_PROMPT;
            prompt = prompt.replace('{{table_list}}', tableList);
            prompt = prompt.replace('{{question}}', question);

            const messages = [
                { role: 'system', content: 'You are a precise schema selector. Output ONLY a JSON array.' },
                { role: 'user', content: prompt }
            ];

            console.log(`[SchemaSelection] RETRY: Asking AI with compact prompt...`);
            const response = await aiService.generateJson(messages, false);
            const result = this._processSelectionResult(response, allTableNames);
            if (result) return result;

        } catch (retryError) {
            console.error('[SchemaSelection] Retry also failed:', retryError.message);
        }

        // Fallback to all tables if AI fails completely
        console.warn('[SchemaSelection] Both attempts failed, falling back to basic cap.');
        return new Set(allTableNames.slice(0, MAX_TABLES));
    }

    /**
     * Process AI selection response into final table set.
     * @returns {Set<string>|null} - Result set or null if AI returned nothing useful
     */
    _processSelectionResult(response, allTableNames) {
        const selectedTables = this._parseTableList(response, allTableNames);

        if (selectedTables.size === 0) {
            console.warn('[SchemaSelection] AI returned empty list.');
            return null;
        }

        // Cap at MAX_TABLES
        if (selectedTables.size > MAX_TABLES) {
            const capped = new Set();
            for (const t of selectedTables) {
                if (capped.size >= MAX_TABLES) break;
                capped.add(t);
            }
            console.log(`[SchemaSelection] Capped from ${selectedTables.size} to ${MAX_TABLES} tables: [${[...capped].join(', ')}]`);
            return capped;
        }

        console.log(`[SchemaSelection] Selected ${selectedTables.size} tables: [${[...selectedTables].join(', ')}]`);
        return selectedTables;
    }

    /**
     * Parse AI response into a set of valid table names.
     */
    _parseTableList(response, validTableNames) {
        const validSet = new Set(validTableNames);
        const result = new Set();

        try {
            // Try to extract JSON array
            let cleaned = response.trim();

            // Remove thinking tags if present
            const thinkEnd = cleaned.indexOf('</think>');
            if (thinkEnd !== -1) {
                cleaned = cleaned.substring(thinkEnd + 8).trim();
            }

            // Find JSON array
            const startBracket = cleaned.indexOf('[');
            const endBracket = cleaned.lastIndexOf(']');
            if (startBracket !== -1 && endBracket !== -1) {
                const jsonStr = cleaned.substring(startBracket, endBracket + 1);
                const parsed = JSON.parse(jsonStr);

                if (Array.isArray(parsed)) {
                    for (const name of parsed) {
                        if (typeof name === 'string' && validSet.has(name)) {
                            result.add(name);
                        }
                    }
                }
            }
        } catch (e) {
            console.warn('[SchemaSelection] Failed to parse AI response:', e.message);
        }

        return result;
    }
}

module.exports = new SchemaSelectionService();
