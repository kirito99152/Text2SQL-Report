
const schemaService = require('../services/schemaService');
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

        if (req.body.schema) {
            // 1a. Direct Schema provided (Bootstrap mode)
            console.log("[Controller] Schema provided in request body.");
            enrichedSchema = req.body.schema;

            // Enrich schema (using Cache if available)
            enrichedSchema = await schemaService.enrichSchema(enrichedSchema, workerId);

            // Build text context for Planning
            schemaContext = schemaService.buildSchemaContext(enrichedSchema);

        } else if (req.body.schemaContext) {
            // Legacy/Test mode where text is provided directly
            schemaContext = req.body.schemaContext;
        } else if (req.body.connectionString) {
            // 1b. Reverse Engineer from DB
            console.log("[Controller] Reverse engineering schema from connection string...");
            const dbService = require('../services/dbService');
            enrichedSchema = await dbService.getFullSchema(req.body.connectionString);

            // Enrich
            enrichedSchema = await schemaService.enrichSchema(enrichedSchema, workerId);

            // Build text context
            schemaContext = schemaService.buildSchemaContext(enrichedSchema);
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

        // 3. Generate Query Plan (Text-based optimization for Qwen3-8B)
        const plan = await planningService.generatePlan(question, schemaContext);

        // Note: With text-based plan, we skip the structured confidence check for now.
        // We rely on the model to ask for clarification if needed, though that logic 
        // would need to be parsed from the text if we wanted to handle it explicitly.

        // 4. Generate SQL
        // The SQL service prompt now expects {{query_plan}} which can be text.
        let sql = await sqlService.generateSql(plan, schemaContext);

        // 4b. Self-Correction (Thinking enabled)
        sql = await selfCheckService.verifyAndCorrectSql(plan, schemaContext, sql);

        // 5. Execution-Based Correction (New Step)
        let executionResult = null;

        // If dbId is provided, we can validate the SQL by executing it.
        // If it fails, we ask the AI to fix it based on the error message.
        // 5. Execution-Based Correction (Separated Service)
        // If dbId is provided, we can validate the SQL by executing it.
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
