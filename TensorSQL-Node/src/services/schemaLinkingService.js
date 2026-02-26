
const fs = require('fs');
const path = require('path');

class SchemaLinkingService {
    constructor() {
        this.tablesData = null;
        this.schemasMap = {};  // db_id -> raw schema from tables.json
    }

    /**
     * Load tables.json on first use (lazy init).
     */
    _ensureLoaded() {
        if (this.tablesData) return;

        const tablesPath = path.resolve(__dirname, '../../data/tables.json');
        if (!fs.existsSync(tablesPath)) {
            console.warn('[SchemaLinkingService] tables.json not found at', tablesPath);
            this.tablesData = [];
            return;
        }

        try {
            const raw = fs.readFileSync(tablesPath, 'utf-8');
            this.tablesData = JSON.parse(raw);
            for (const schema of this.tablesData) {
                this.schemasMap[schema.db_id] = schema;
            }
            console.log(`[SchemaLinkingService] Loaded ${this.tablesData.length} schemas from tables.json`);
        } catch (e) {
            console.error('[SchemaLinkingService] Failed to load tables.json:', e.message);
            this.tablesData = [];
        }
    }

    /**
     * Generate schema linking text only.
     */
    generateLinking(question, dbId) {
        this._ensureLoaded();
        if (!dbId || !this.schemasMap[dbId]) return "";
        const rawSchema = this.schemasMap[dbId];
        const { linkingText } = this._matchTokens(question, rawSchema);
        return linkingText;
    }

    /**
     * Generate schema linking AND a set of relevant table names (expanded via FK).
     * Used for hybrid schema filtering.
     *
     * @param {string} question
     * @param {string} dbId
     * @returns {{ linkingText: string, relevantTables: Set<string> | null }}
     *   relevantTables is null if no matches found (signals: use full schema)
     */
    generateLinkingWithRelevantTables(question, dbId) {
        this._ensureLoaded();
        if (!dbId || !this.schemasMap[dbId]) {
            return { linkingText: "", relevantTables: null };
        }

        const rawSchema = this.schemasMap[dbId];
        const { linkingText, matchedTableIndices } = this._matchTokens(question, rawSchema);

        if (matchedTableIndices.size === 0) {
            return { linkingText, relevantTables: null }; // fallback to full
        }

        // Expand matched tables via FK connections
        const expandedIndices = this._expandViaFK(matchedTableIndices, rawSchema);

        // Convert indices to table names
        const tableNames = rawSchema.table_names || [];
        const relevantTables = new Set();
        for (const idx of expandedIndices) {
            if (idx < tableNames.length) {
                relevantTables.add(tableNames[idx]);
            }
        }

        console.log(`[SchemaLinking] Matched ${matchedTableIndices.size} tables, expanded to ${relevantTables.size}: [${[...relevantTables].join(', ')}]`);

        return { linkingText, relevantTables };
    }

    /**
     * Expand matched table indices by including FK-connected tables and junction tables.
     * This ensures we don't lose important relationships when filtering.
     */
    _expandViaFK(matchedIndices, rawSchema) {
        const expanded = new Set(matchedIndices);
        const foreignKeys = rawSchema.foreign_keys || [];
        const colNames = rawSchema.column_names || [];

        // Build adjacency: tableIdx -> Set of connected tableIdx via FK
        const adjacency = {};
        for (const [srcIdx, tgtIdx] of foreignKeys) {
            const srcTableIdx = colNames[srcIdx]?.[0];
            const tgtTableIdx = colNames[tgtIdx]?.[0];
            if (srcTableIdx === undefined || tgtTableIdx === undefined) continue;
            if (srcTableIdx === -1 || tgtTableIdx === -1) continue;

            if (!adjacency[srcTableIdx]) adjacency[srcTableIdx] = new Set();
            if (!adjacency[tgtTableIdx]) adjacency[tgtTableIdx] = new Set();
            adjacency[srcTableIdx].add(tgtTableIdx);
            adjacency[tgtTableIdx].add(srcTableIdx);
        }

        // 1-hop expansion: add all directly FK-connected tables
        for (const idx of matchedIndices) {
            if (adjacency[idx]) {
                for (const neighbor of adjacency[idx]) {
                    expanded.add(neighbor);
                }
            }
        }

        // Junction table detection: if two matched tables both connect to
        // a common intermediate table, include that junction table
        const matchedArray = [...matchedIndices];
        for (let i = 0; i < matchedArray.length; i++) {
            for (let j = i + 1; j < matchedArray.length; j++) {
                const neighborsI = adjacency[matchedArray[i]] || new Set();
                const neighborsJ = adjacency[matchedArray[j]] || new Set();
                for (const n of neighborsI) {
                    if (neighborsJ.has(n)) {
                        expanded.add(n); // junction table
                    }
                }
            }
        }

        return expanded;
    }

    /**
     * Core matching logic: tokenize question and match against schema originals.
     * Returns both linking text and set of matched table indices.
     */
    _matchTokens(question, rawSchema) {
        const qClean = question.toLowerCase().replace(/[.,;:!?()\[\]{}"'`]/g, ' ');

        const tableOriginals = rawSchema.table_names_original || [];
        const tableNames = rawSchema.table_names || [];
        const colOriginals = rawSchema.column_names_original || [];
        const colNames = rawSchema.column_names || [];
        const primaryKeys = new Set(rawSchema.primary_keys || []);

        const fkMap = {};
        for (const [srcIdx, tgtIdx] of (rawSchema.foreign_keys || [])) {
            fkMap[srcIdx] = tgtIdx;
        }

        const matched = [];
        const matchedSet = new Set();
        const matchedTableIndices = new Set(); // Track which tables were matched

        // Match table names (longest first)
        const tablePhrases = [];
        for (let tIdx = 0; tIdx < tableOriginals.length; tIdx++) {
            const orig = tableOriginals[tIdx];
            if (orig && orig !== '*') {
                tablePhrases.push({ orig: orig.toLowerCase(), tIdx, tname: tableNames[tIdx] });
            }
        }
        tablePhrases.sort((a, b) => b.orig.length - a.orig.length);

        for (const { orig, tIdx, tname } of tablePhrases) {
            if (qClean.includes(orig)) {
                const key = `table:${tname}`;
                if (!matchedSet.has(key)) {
                    matched.push(`- "${orig}" → ${tname} (bảng)`);
                    matchedSet.add(key);
                    matchedTableIndices.add(tIdx);
                }
            }
        }

        // Match column names (longest/multi-word first, skip generic short names)
        const GENERIC_SHORT = new Set(['id', 'tên', 'năm', 'ngày', 'số', 'loại', 'mã']);
        const colPhrases = [];
        for (let cIdx = 0; cIdx < colOriginals.length; cIdx++) {
            const pair = colOriginals[cIdx];
            if (pair[0] === -1) continue;
            const origName = pair[1];
            if (!origName || origName === '*') continue;

            const origLower = origName.toLowerCase();
            const tIdx = pair[0];
            const colSqlName = cIdx < colNames.length ? colNames[cIdx][1] : origName;
            const tSqlName = tIdx < tableNames.length ? tableNames[tIdx] : '?';
            colPhrases.push({ origLower, tSqlName, colSqlName, cIdx, tIdx });
        }
        colPhrases.sort((a, b) => {
            const aWords = a.origLower.split(' ').length;
            const bWords = b.origLower.split(' ').length;
            if (bWords !== aWords) return bWords - aWords;
            return b.origLower.length - a.origLower.length;
        });

        for (const { origLower, tSqlName, colSqlName, cIdx, tIdx } of colPhrases) {
            const tokens = origLower.split(' ');
            if (tokens.length < 2 && GENERIC_SHORT.has(origLower)) continue;
            // Skip very short names (single chars like 'h', 'l') that match too broadly
            if (origLower.length < 2) continue;

            if (qClean.includes(origLower)) {
                const key = `col:${tSqlName}.${colSqlName}`;
                if (!matchedSet.has(key)) {
                    let suffix = "";
                    if (primaryKeys.has(cIdx)) {
                        suffix = " [PK]";
                    } else if (fkMap[cIdx] !== undefined) {
                        const targetIdx = fkMap[cIdx];
                        if (targetIdx < colNames.length) {
                            const targetTIdx = colNames[targetIdx][0];
                            const targetCol = colNames[targetIdx][1];
                            const targetTable = targetTIdx < tableNames.length ? tableNames[targetTIdx] : '?';
                            suffix = ` [FK→${targetTable}.${targetCol}]`;
                        }
                    }
                    matched.push(`- "${origLower}" → ${tSqlName}.${colSqlName}${suffix}`);
                    matchedSet.add(key);
                    matchedTableIndices.add(tIdx); // Track table via column match
                }
            }
        }

        const linkingText = matched.length === 0
            ? ""
            : "SCHEMA LINKING (matched question tokens → schema):\n" + matched.join("\n");

        return { linkingText, matchedTableIndices };
    }
}

module.exports = new SchemaLinkingService();
