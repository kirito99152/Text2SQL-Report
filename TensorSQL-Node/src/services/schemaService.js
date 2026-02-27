
const aiService = require('./aiService');
const prompts = require('../prompts');
const cacheService = require('./cacheService');

class SchemaService {

    /**
     * Checks if the schema needs descriptions and generates them if missing.
     * @param {Object} schema - The input schema object (tables: [{name, columns: [...]}, ...])
     * @returns {Object} - The enriched schema
     */
    constructor() {
        this.currentBatchItemLimit = 50;
        this.MIN_BATCH_ITEM_LIMIT = 25;
        this.BATCH_SIZE_REDUCTION_STEP = 15;
    }

    /**
     * Checks if the schema needs descriptions and generates them if missing.
     * @param {Object} schema - The input schema object (tables: [{name, columns: [...]}, ...])
     * @returns {Object} - The enriched schema
     */
    async enrichSchema(schema, workerId) {
        const workerPrefix = workerId !== undefined ? `[Worker ${workerId}] ` : "";
        // 1. Check Cache first
        try {
            console.log(`[SchemaService] ${workerPrefix}Checking cache for schema...`);
            const cachedDescriptions = await cacheService.getDescriptions(schema);
            if (cachedDescriptions) {
                console.log(`[SchemaService] ${workerPrefix}Cache HIT. Using cached descriptions.`);
                return this.applyDescriptions(schema, cachedDescriptions);
            }
            console.log(`[SchemaService] ${workerPrefix}Cache MISS. Proceeding to generation.`);
        } catch (e) {
            console.warn(`[SchemaService] ${workerPrefix}Cache check failed, proceeding without cache.`, e);
        }

        if (!schema || !schema.tables) {
            throw new Error("Invalid schema format");
        }

        const tablesMissingDesc = [];
        let needsEnrichment = false;

        // Check for missing descriptions
        for (const table of schema.tables) {
            let tableHasMissing = !table.description;
            if (!tableHasMissing) {
                for (const col of table.columns) {
                    if (!col.description) {
                        tableHasMissing = true;
                        break;
                    }
                }
            }

            if (tableHasMissing) {
                tablesMissingDesc.push(table);
                needsEnrichment = true;
            }
        }

        if (!needsEnrichment || tablesMissingDesc.length === 0) {
            console.log(`[SchemaService] ${workerPrefix}Schema already has descriptions. Skipping enrichment.`);
            return schema;
        }

        console.log(`[SchemaService] ${workerPrefix}Generating descriptions for ${tablesMissingDesc.length} tables...`);

        // Batch processing logic
        let currentBatch = [];
        let currentBatchItemCount = 0;
        let batchNumber = 1;

        for (const table of tablesMissingDesc) {
            const tableItemCount = 1 + table.columns.length;

            if (currentBatch.length > 0 && currentBatchItemCount + tableItemCount > this.currentBatchItemLimit) {
                await this.processBatchWithRetry(currentBatch, batchNumber, workerPrefix);
                currentBatch = [];
                currentBatchItemCount = 0;
                batchNumber++;
            }

            currentBatch.push(table);
            currentBatchItemCount += tableItemCount;
        }

        if (currentBatch.length > 0) {
            await this.processBatchWithRetry(currentBatch, batchNumber, workerPrefix);
        }

        // Save generated descriptions to cache
        // We construct a full descriptions object from the now-modified schema
        // This is slightly inefficient but safer than tracking partial updates
        const descriptionsToCache = {};
        for (const table of schema.tables) {
            const schemaPrefix = table.schema || "dbo";
            const tableKey = `table:${schemaPrefix}.${table.name}`;
            if (table.description) {
                descriptionsToCache[tableKey] = { description: table.description };
            }
            for (const col of table.columns) {
                const colKey = `column:${schemaPrefix}.${table.name}.${col.name}`;
                if (col.description) {
                    descriptionsToCache[colKey] = { description: col.description };
                }
            }
        }

        try {
            await cacheService.saveDescriptions(schema, descriptionsToCache);
        } catch (e) {
            console.warn("[SchemaService] Failed to save to cache.", e);
        }

        return schema;
    }

    async processBatchWithRetry(batchToProcess, batchNumber, workerPrefix = "") {
        if (!batchToProcess || batchToProcess.length === 0) return;

        const itemCount = batchToProcess.reduce((sum, t) => sum + 1 + t.columns.length, 0);

        try {
            console.log(`[SchemaService] ${workerPrefix}Processing batch ${batchNumber} with ${itemCount} items.`);

            const schemaText = this.schemaToMinimalText(batchToProcess);
            let systemPrompt = prompts.DESCRIPTION_GENERATION_SYSTEM_PROMPT;
            let userHeader = prompts.DESCRIPTION_GENERATION_USER_HEADER;

            const messages = [
                { role: 'system', content: systemPrompt },
                { role: 'user', content: userHeader + schemaText }
            ];

            const jsonResponse = await aiService.generateJson(messages);
            const cleanJson = this.extractJson(jsonResponse);
            const descriptions = JSON.parse(cleanJson);

            this.applyDescriptionsToBatch(batchToProcess, descriptions);
            console.log(`[SchemaService] ${workerPrefix}Successfully processed batch ${batchNumber}.`);

        } catch (error) {
            console.error(`[SchemaService] ${workerPrefix}Error processing batch ${batchNumber} with ${itemCount} items.`, error);

            // Adaptive sizing
            if (this.currentBatchItemLimit > this.MIN_BATCH_ITEM_LIMIT) {
                const oldLimit = this.currentBatchItemLimit;
                this.currentBatchItemLimit = Math.max(this.MIN_BATCH_ITEM_LIMIT, this.currentBatchItemLimit - this.BATCH_SIZE_REDUCTION_STEP);
                console.warn(`[SchemaService] ${workerPrefix}Batch failed. Reduced batch limit from ${oldLimit} to ${this.currentBatchItemLimit}.`);
            }

            if (batchToProcess.length <= 1) {
                throw new Error(`Failed to generate descriptions for single table '${batchToProcess[0]?.name}'. Error: ${error.message}`);
            }

            // Recursive split
            const mid = Math.floor(batchToProcess.length / 2);
            const firstHalf = batchToProcess.slice(0, mid);
            const secondHalf = batchToProcess.slice(mid);

            console.log(`[SchemaService] ${workerPrefix}Splitting batch ${batchNumber} into two halves (${firstHalf.length} and ${secondHalf.length} tables) and retrying.`);

            await this.processBatchWithRetry(firstHalf, batchNumber, workerPrefix);
            await this.processBatchWithRetry(secondHalf, batchNumber, workerPrefix);
        }
    }

    applyDescriptionsToBatch(tables, descriptions) {
        for (const table of tables) {
            const schemaPrefix = table.schema || "dbo";
            const tableKey = `table:${schemaPrefix}.${table.name}`;

            // Case-insensitive check might be needed if keys vary, but C# code did simpler check.
            // Here we assume exact match or simple key construction.
            // If the AI returns case-insensitive keys, we might need to normalize.
            // For now, using direct access as in original JS code.

            // Check for direct match
            let descObj = descriptions[tableKey];
            // If not found, try case-insensitive search if needed (omitted for speed unless requested)

            if (descObj && descObj.description) {
                table.description = descObj.description;
            }

            for (const col of table.columns) {
                const colKey = `column:${schemaPrefix}.${table.name}.${col.name}`;
                descObj = descriptions[colKey];
                if (descObj && descObj.description) {
                    col.description = descObj.description;
                }
            }
        }
    }

    /**
     * Applies generated descriptions to the schema object.
     * @param {Object} schema - The original schema object.
     * @param {Object} descriptions - The descriptions object from AI/cache.
     * @returns {Object} - The schema object with descriptions applied.
     */
    applyDescriptions(schema, descriptions) {
        // Same as applyDescriptionsToBatch but for whole schema structure
        this.applyDescriptionsToBatch(schema.tables, descriptions);
        return schema;
    }

    /**
     * Converts a list of tables into a minimal text format for description generation.
     * @param {Array<Object>} tables - An array of table objects (e.g., tablesMissingDesc).
     * @returns {string} - The formatted text.
     */
    schemaToMinimalText(tables) {
        let schemaString = "";
        for (const table of tables) {
            const schemaPrefix = table.schema || "dbo";
            schemaString += `Table: ${schemaPrefix}.${table.name}\n`;
            for (const col of table.columns) {
                schemaString += `  - Column: ${schemaPrefix}.${table.name}.${col.name}\n`;
            }
        }
        return schemaString;
    }

    /**
     * Converts the schema object into the text format required by the Planning prompt.
     * @param {Object} schema 
     */
    buildSchemaContext(schema) {
        let sb = "";
        for (const table of schema.tables) {
            const schemaPrefix = table.schema || "dbo";
            sb += `### ${schemaPrefix}.${table.name}\n`;
            if (table.description) {
                sb += `Description: ${table.description}\n`;
            }

            for (const col of table.columns) {
                // Format: - ColumnName (DataType) [PK] [FK]: Description
                let line = `- ${col.name} (${col.dataType || 'nvarchar'})`;
                if (col.isPrimaryKey) line += " [PK]";
                // Note: FK info usually comes from relationships, but if marked on column:
                if (col.isForeignKey) line += " [FK]";

                if (col.description) {
                    line += `: ${col.description}`;
                }
                sb += line + "\n";
            }
            sb += "\n";
        }

        // Add relationships if available
        if (schema.relationships && schema.relationships.length > 0) {
            sb += "### Relationships\n";
            for (const rel of schema.relationships) {
                // Format: - fkTable.fkCol -> pkTable.pkCol
                sb += `- ${rel.fkTable}.${rel.fkColumn} -> ${rel.pkTable}.${rel.pkColumn}\n`;
            }
            sb += "\n";
        }

        return sb;
    }

    /**
     * Builds a filtered schema context containing only relevant tables.
     * Falls back to full schema if relevantTables is null.
     * 
     * @param {Object} schema - The enriched schema object
     * @param {Set<string>|null} relevantTables - Set of relevant table names, or null for full
     * @param {string} linkingText - Optional schema linking hints to prepend
     * @returns {string} - The filtered schema context
     */
    buildFilteredSchemaContext(schema, relevantTables, linkingText = "") {
        // Fallback to full schema if no relevant tables identified
        if (!relevantTables || (relevantTables instanceof Set ? relevantTables.size === 0 : relevantTables.length === 0)) {
            let context = this.buildSchemaContext(schema);
            if (linkingText) {
                context = linkingText + "\n\n" + context;
            }
            return context;
        }

        // Ensure it's a Set if it's an Array
        if (Array.isArray(relevantTables)) {
            relevantTables = new Set(relevantTables);
        }

        let sb = linkingText ? linkingText + "\n\n" : "";
        const includedTables = new Set();

        for (const table of schema.tables) {
            if (!relevantTables.has(table.name)) continue;

            includedTables.add(table.name);
            const schemaPrefix = table.schema || "dbo";
            sb += `### ${schemaPrefix}.${table.name}\n`;
            if (table.description) {
                sb += `Description: ${table.description}\n`;
            }

            for (const col of table.columns) {
                let line = `- ${col.name} (${col.dataType || 'nvarchar'})`;
                if (col.isPrimaryKey) line += " [PK]";
                if (col.isForeignKey) line += " [FK]";
                if (col.description) {
                    line += `: ${col.description}`;
                }
                sb += line + "\n";
            }
            sb += "\n";
        }

        // Add relationships where at least one side is in included tables
        if (schema.relationships && schema.relationships.length > 0) {
            const relevantRels = schema.relationships.filter(rel =>
                includedTables.has(rel.fkTable) || includedTables.has(rel.pkTable)
            );
            if (relevantRels.length > 0) {
                sb += "### Relationships\n";
                for (const rel of relevantRels) {
                    sb += `- ${rel.fkTable}.${rel.fkColumn} -> ${rel.pkTable}.${rel.pkColumn}\n`;
                }
                sb += "\n";
            }
        }

        return sb;
    }

    extractJson(text) {
        // Simple regex to extract JSON from code blocks or raw text
        const match = text.match(/```json([\s\S]*?)```/);
        if (match) {
            return match[1].trim();
        }
        // If no code block, maybe the whole text is JSON? 
        // Be careful with leading/trailing text.
        // Try finding first { and last }
        const firstBrace = text.indexOf('{');
        const lastBrace = text.lastIndexOf('}');
        if (firstBrace !== -1 && lastBrace !== -1) {
            return text.substring(firstBrace, lastBrace + 1);
        }
        return text;
    }
}

module.exports = new SchemaService();
