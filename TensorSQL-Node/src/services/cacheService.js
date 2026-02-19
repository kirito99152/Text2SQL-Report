
const sqlite3 = require('sqlite3').verbose();
const path = require('path');
const fs = require('fs');
const crypto = require('crypto');

class CacheService {
    constructor() {
        const dbDir = path.resolve(__dirname, '../../data');
        if (!fs.existsSync(dbDir)) {
            fs.mkdirSync(dbDir, { recursive: true });
        }
        const dbPath = path.join(dbDir, 'cache.db');

        this.db = new sqlite3.Database(dbPath, (err) => {
            if (err) {
                console.error('[CacheService] Could not connect to database', err);
            } else {
                console.log(`[CacheService] Connected to SQLite cache database at ${dbPath}`);
                this.initTable();
            }
        });
    }

    initTable() {
        const sql = `
            CREATE TABLE IF NOT EXISTS schema_descriptions (
                schema_hash TEXT PRIMARY KEY,
                descriptions TEXT,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP
            )
        `;
        this.db.run(sql, (err) => {
            if (err) {
                console.error('[CacheService] Error creating table', err);
            }
        });
    }

    // Helper to generate a consistent hash for a schema object
    generateSchemaHash(schema) {
        // Sort tables and columns to ensure consistent hashing logic
        // Only consider table names and column names for uniqueness regarding descriptions
        const simplified = schema.tables.map(t => ({
            name: t.name,
            columns: t.columns.map(c => c.name).sort()
        })).sort((a, b) => a.name.localeCompare(b.name));

        const str = JSON.stringify(simplified);
        return crypto.createHash('md5').update(str).digest('hex');
    }

    async getDescriptions(schema) {
        const hash = this.generateSchemaHash(schema);
        console.log(`[CacheService] Getting descriptions for hash: ${hash}`);
        return new Promise((resolve, reject) => {
            this.db.get("SELECT descriptions FROM schema_descriptions WHERE schema_hash = ?", [hash], (err, row) => {
                if (err) {
                    console.error("[CacheService] Get error:", err);
                    resolve(null);
                } else if (row) {
                    console.log(`[CacheService] Found row for hash: ${hash}`);
                    try {
                        resolve(JSON.parse(row.descriptions));
                    } catch (e) {
                        console.error("[CacheService] Parse error:", e);
                        resolve(null);
                    }
                } else {
                    console.log(`[CacheService] No row found for hash: ${hash}`);
                    resolve(null);
                }
            });
        });
    }

    async saveDescriptions(schema, descriptions) {
        const hash = this.generateSchemaHash(schema);
        console.log(`[CacheService] Saving descriptions for hash: ${hash}`);
        const jsonDesc = JSON.stringify(descriptions);

        return new Promise((resolve, reject) => {
            this.db.run(
                "INSERT OR REPLACE INTO schema_descriptions (schema_hash, descriptions) VALUES (?, ?)",
                [hash, jsonDesc],
                (err) => {
                    if (err) {
                        console.error("[CacheService] Save error:", err);
                        reject(err);
                    } else {
                        console.log(`[CacheService] Saved successfully for hash: ${hash}`);
                        resolve();
                    }
                }
            );
        });
    }
}

module.exports = new CacheService();
