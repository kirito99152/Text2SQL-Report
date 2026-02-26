
const schemaService = require('../services/schemaService');
const schemaLinkingService = require('../services/schemaLinkingService');
const schemaSelectionService = require('../services/schemaSelectionService');
const planningService = require('../services/planningService');
const sqlService = require('../services/sqlService');
const selfCheckService = require('../services/selfCheckService');

exports.generate = async (req, res) => {
    try {
        const { question, workerId } = req.body;
        const workerPrefix = workerId !== undefined ? `[Worker ${workerId}] ` : "";

        if (!question) {
            return res.status(400).json({ error: "Missing 'question' in request body." });
        }

        console.log(`[Controller] ${workerPrefix}Received request: "${question}"`);

        // 1. Get Schema
        let schemaContext = "";
        let enrichedSchema = null;

        // Schema Linking: token match → get hints + pre-filtered tables
        const dbId = req.body.dbId || null;
        let linkingText = "";
        let tokenMatchedTables = null;

        if (dbId) {
            const linkingResult = schemaLinkingService.generateLinkingWithRelevantTables(question, dbId);
            linkingText = linkingResult.linkingText;
            tokenMatchedTables = linkingResult.relevantTables;
            if (linkingText) {
                console.log(`[Controller] ${workerPrefix}Schema linking: ${linkingText.split('\n').length - 1} matches`);
            }
        }

        if (req.body.schema) {
            // 1a. Direct Schema provided (Bootstrap mode)
            console.log("[Controller] Schema provided in request body.");
            enrichedSchema = req.body.schema;

            // Enrich schema (using Cache if available)
            enrichedSchema = await schemaService.enrichSchema(enrichedSchema, workerId);

            // AI Schema Selection: token match → AI refine → cap 10
            const relevantTables = await schemaSelectionService.selectRelevantTables(
                question, enrichedSchema, linkingText, tokenMatchedTables
            );

            // Build FILTERED context (used for ALL steps — small context window)
            schemaContext = schemaService.buildFilteredSchemaContext(enrichedSchema, relevantTables, linkingText);

        } else if (req.body.schemaContext) {
            // Legacy/Test mode where text is provided directly
            schemaContext = req.body.schemaContext;
            if (linkingText) {
                schemaContext += "\n" + linkingText + "\n";
            }
        } else if (req.body.connectionString) {
            // 1b. Reverse Engineer from DB
            console.log("[Controller] Reverse engineering schema from connection string...");
            const dbService = require('../services/dbService');
            enrichedSchema = await dbService.getFullSchema(req.body.connectionString);

            // Enrich
            enrichedSchema = await schemaService.enrichSchema(enrichedSchema, workerId);

            // AI Schema Selection
            const relevantTables = await schemaSelectionService.selectRelevantTables(
                question, enrichedSchema, linkingText, tokenMatchedTables
            );

            // Build filtered context
            schemaContext = schemaService.buildFilteredSchemaContext(enrichedSchema, relevantTables, linkingText);
        } else {
            return res.status(400).json({ status: "error", message: "Missing connectionString, schema, or schemaContext" });
        }

        // 2. Pre-Check: Only Enrich?
        if (req.body.onlyEnrich) {
            console.log(`[Controller] ${workerPrefix}'onlyEnrich' flag is set. Returning enriched schema.`);
            return res.status(200).json({
                status: "success",
                enrichedSchema: enrichedSchema,
                message: "Schema enriched successfully."
            });
        }

        // 3. Generate Query Plan (filtered schema)
        const plan = await planningService.generatePlan(question, schemaContext);

        // 4. Generate SQL (filtered schema)
        let sql = await sqlService.generateSql(plan, schemaContext);

        // 4b. Self-Correction (filtered schema)
        sql = await selfCheckService.verifyAndCorrectSql(plan, schemaContext, sql);

        // 5. Execution-Based Correction
        let executionResult = null;
        if (req.body.dbId) {
            const executionCorrectionService = require('../services/executionCorrectionService');
            sql = await executionCorrectionService.executeAndCorrect(
                req.body.dbId,
                sql,
                question,
                schemaContext,
                plan
            );
        }

        // 6. Return success
        return res.status(200).json({
            status: "success",
            sql: sql,
            result: executionResult,
            plan: plan,
            enrichedSchema: enrichedSchema
        });

    } catch (error) {
        console.error("[Controller] Error processing request:", error);
        return res.status(500).json({ error: error.message });
    }
};
