
const schemaService = require('../services/schemaService');
const schemaSelectionService = require('../services/schemaSelectionService');
const planningService = require('../services/planningService');
const sqlService = require('../services/sqlService');
const selfCheckService = require('../services/selfCheckService');
const schemaLinkingService = require('../services/schemaLinkingService');
const fs = require('fs');
const path = require('path');

const logDir = path.join(__dirname, '../../logs');

function logStep(pipeline, question, step, status) {
    const timestamp = new Date().toISOString();
    const logFilePath = path.join(logDir, `pipeline_execution_${pipeline}.log`);
    const logLine = `[${timestamp}] [${pipeline}] - Q: "${question.substring(0, 30)}..." - Step: ${step} - Status: ${status}\n`;
    try {
        if (!fs.existsSync(logDir)) {
            fs.mkdirSync(logDir, { recursive: true });
        }
        fs.appendFileSync(logFilePath, logLine);
    } catch (err) {
        console.error("Error writing to log file", err);
    }
}

exports.generate = async (req, res) => {
    try {
        const { question, workerId } = req.body;
        const pipeline = req.body.pipeline || 'base';
        const workerPrefix = workerId !== undefined ? `[Worker ${workerId}] ` : "";

        if (!question) {
            return res.status(400).json({ error: "Missing 'question' in request body." });
        }

        console.log(`[Controller] ${workerPrefix}Received request: "${question}" (pipeline: ${pipeline})`);

        logStep(pipeline, question, "START", "Received");

        // 1. Get Schema
        let schemaContext = "";
        let enrichedSchema = null;

        // AI Schema Selection will handle table filtering
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

            // AI Schema Selection
            logStep(pipeline, question, "Schema Selection", "EXECUTED");
            const relevantTables = await schemaSelectionService.selectRelevantTables(
                question, enrichedSchema, linkingText, tokenMatchedTables
            );

            // Build FILTERED context
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
            logStep(pipeline, question, "Schema Selection", "EXECUTED");
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
        let plan = null;
        if (pipeline !== 'ablation1') {
            logStep(pipeline, question, "Planning", "EXECUTED");
            plan = await planningService.generatePlan(question, schemaContext, pipeline);
        } else {
            logStep(pipeline, question, "Planning", "SKIPPED");
        }

        // 4. Generate SQL (filtered schema)
        logStep(pipeline, question, "SQL Generation", "EXECUTED");
        let sql = await sqlService.generateSql(plan, schemaContext, question, pipeline);

        // 4b. Self-Correction (filtered schema)
        if (pipeline !== 'ablation2') {
            logStep(pipeline, question, "Self-Check", "EXECUTED");
            sql = await selfCheckService.verifyAndCorrectSql(plan, schemaContext, sql, pipeline);
        } else {
            logStep(pipeline, question, "Self-Check", "SKIPPED");
        }

        // 5. Execution-Based Correction
        let executionResult = null;
        if (req.body.dbId && pipeline !== 'ablation2') {
            logStep(pipeline, question, "Execution-Correction", "EXECUTED");
            const executionCorrectionService = require('../services/executionCorrectionService');
            sql = await executionCorrectionService.executeAndCorrect(
                req.body.dbId,
                sql,
                question,
                schemaContext,
                plan,
                pipeline
            );
        } else if (req.body.dbId) {
            logStep(pipeline, question, "Execution-Correction", "SKIPPED (ablation2)");
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
