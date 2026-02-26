
const aiService = require('./aiService');
const prompts = require('../prompts');

const MAX_TABLES = 10;

class SchemaSelectionService {

    /**
     * Use AI to select relevant tables from the full schema.
     * Combines token-matching hints with AI intelligence for accurate selection.
     * 
     * @param {string} question - The Vietnamese question
     * @param {Object} enrichedSchema - The enriched schema object with tables[]
     * @param {string} linkingText - Schema linking hints from token matching
     * @param {Set<string>|null} tokenMatchedTables - Tables matched by token matching (pre-filter)
     * @returns {Set<string>} - Set of relevant table names (max MAX_TABLES)
     */
    async selectRelevantTables(question, enrichedSchema, linkingText, tokenMatchedTables) {
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

        // Build prompt
        let prompt = prompts.SCHEMA_SELECTION_PROMPT;
        prompt = prompt.replace('{{table_list}}', tableList);
        prompt = prompt.replace('{{question}}', question);
        prompt = prompt.replace('{{schema_linking_hints}}', linkingText
            ? `SCHEMA LINKING HINTS (token matching):\n${linkingText}`
            : '');

        const messages = [
            { role: 'system', content: 'You are a precise schema selector. Output ONLY a JSON array.' },
            { role: 'user', content: prompt }
        ];

        try {
            console.log(`[SchemaSelection] Asking AI to select from ${allTableNames.length} tables...`);
            // Thinking disabled for speed
            const response = await aiService.generateJson(messages, false);

            // Parse JSON array from response
            const selectedTables = this._parseTableList(response, allTableNames);

            if (selectedTables.size === 0) {
                // AI returned nothing useful, fall back to token matching
                console.warn('[SchemaSelection] AI returned empty list, falling back to token matching.');
                return tokenMatchedTables || new Set(allTableNames);
            }

            // Merge with token-matched tables (ensure we don't lose direct matches)
            if (tokenMatchedTables) {
                for (const t of tokenMatchedTables) {
                    selectedTables.add(t);
                }
            }

            // Cap at MAX_TABLES (prioritize AI-selected first, then token-matched)
            if (selectedTables.size > MAX_TABLES) {
                const capped = new Set();
                // First add AI-selected (they're already in selectedTables)
                for (const t of selectedTables) {
                    if (capped.size >= MAX_TABLES) break;
                    capped.add(t);
                }
                console.log(`[SchemaSelection] Capped from ${selectedTables.size} to ${MAX_TABLES} tables: [${[...capped].join(', ')}]`);
                return capped;
            }

            console.log(`[SchemaSelection] Selected ${selectedTables.size} tables: [${[...selectedTables].join(', ')}]`);
            return selectedTables;

        } catch (error) {
            console.error('[SchemaSelection] AI selection failed:', error.message);
            // Fallback to token matching or all tables
            return tokenMatchedTables || new Set(allTableNames.slice(0, MAX_TABLES));
        }
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
