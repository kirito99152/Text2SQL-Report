const Database = require('better-sqlite3');
const path = require('path');

const DB_PATH = '/app/sqlite-generator/generated_databases/assets_maintenance.sqlite';
const GEN_SQL = "SELECT T1.id_hop_dong_bao_tri, COUNT(*) FROM dbo.hop_dong_bao_tri T1 JOIN dbo.tai_san T2 ON T1.id_hop_dong_bao_tri = T2.id_hop_dong_bao_tri GROUP BY T1.id_hop_dong_bao_tri";

function testExecution() {
    try {
        const db = new Database(DB_PATH, { readonly: true, timeout: 5000 });

        // Logic from index.js fix
        const removeSchemaPrefix = (s) => s ? s.replace(/\b(dbo|public)\./gi, '') : s;
        const normalizedSql = removeSchemaPrefix(GEN_SQL);

        console.log("Original SQL:", GEN_SQL);
        console.log("Normalized SQL:", normalizedSql);

        const stmt = db.prepare(normalizedSql);
        const rows = stmt.all();
        console.log("Execution Success! Rows:", rows.length);
        console.log("First row:", rows[0]);

        db.close();
    } catch (err) {
        console.error("Execution Failed:", err.message);
        process.exit(1);
    }
}

testExecution();
