
# TensorSQL-Node

This is a Node.js/Express implementation of the Text2SQL flow, migrated from the original C# TensorSQL project.

## Features

- **Unified Flow**: Handles Schema Enrichment (Description Generation), Query Planning, and SQL Generation in a single API call.
- **Mock Mode**: Allows testing the API flow without a live LLM connection.
- **SQL Execution**: Optional execution of generated SQL against a SQL Server database.

## Setup

1.  **Install Dependencies**:
    ```bash
    npm install
    ```

2.  **Configuration**:
    Create a `.env` file in the root directory:
    ```env
    PORT=3005
    LLM_ENDPOINT_URL=https://your-llm-endpoint.com/generate_output
    LLM_API_KEY=your_api_key
    LLM_MOCK_MODE=false
    ```

    *   `LLM_MOCK_MODE=true`: Returns dummy data for testing without calling the LLM.

## Usage

### Start Server
```bash
npm start
```
Server runs on `http://localhost:3005` (or configured PORT).

### API Endpoint

**POST** `/api/text2sql/generate`

**Request Body**:
```json
{
  "question": "Cho tôi biết danh sách sinh viên học lớp CNTT1",
  "execute": false, 
  "connectionString": "Server=localhost;Database=TestDB;User Id=sa;Password=your_password;",
  "schema": {
    "tables": [
      {
        "name": "SinhVien",
        "columns": [
          { "name": "MaSV", "dataType": "varchar" },
          { "name": "TenSV", "dataType": "nvarchar" },
          { "name": "MaLop", "dataType": "varchar" }
        ]
      },
      {
        "name": "Lop",
        "columns": [
          { "name": "MaLop", "dataType": "varchar" },
          { "name": "TenLop", "dataType": "nvarchar" }
        ]
      }
    ]
  }
}
```

*   `execute`: Set to `true` to execute the generated SQL (requires `connectionString`).
*   `connectionString`: Required if `execute` is true.

**Response**:
```json
{
  "status": "success",
  "sql": "SELECT ...",
  "result": { "rows": [...], "rowsAffected": 0 },
  "plan": { ... },
  "enrichedSchema": { ... }
}
```

## Project Structure

- `src/controllers`: Request handlers.
- `src/services`: Business logic (AI, Schema, Planning, SQL, Execution).
- `src/prompts.js`: Centralized prompt templates extracted from the C# project.
- `src/routes`: API route definitions.
