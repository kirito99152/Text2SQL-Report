
const axios = require('axios');

class AiService {
    constructor() {
        // Default to the URL of the new Request-Hub, but allow override via env
        this.endpoint = process.env.LLM_ENDPOINT_URL || "http://localhost:4000/generate_output";
        this.apiKey = process.env.LLM_API_KEY || "";
    }

    async generateJson(messages, enableThinking = false) {
        try {
            const payload = {
                messages: messages,
                gen: {
                    max_new_tokens: 14000,
                    do_sample: false,
                    enable_thinking: enableThinking
                }
            };

            const config = {
                headers: {
                    'Content-Type': 'application/json'
                }
            };

            if (this.apiKey) {
                config.headers['Authorization'] = `Bearer ${this.apiKey}`;
            }

            if (process.env.LLM_MOCK_MODE === 'true') {
                console.log("[AiService] MOCK MODE ENABLED. Returning dummy response.");
                return this.getMockResponse(messages);
            }

            console.log(`[AiService] Sending request to ${this.endpoint} (Thinking: ${enableThinking})`);
            const response = await axios.post(this.endpoint, payload, config);

            // Based on QwenHttpClient.cs: return jsonResponse.RootElement.GetProperty("output").GetString()
            if (response.data && response.data.output) {
                return response.data.output;
            } else {
                console.error("[AiService] Unexpected response format:", response.data);
                throw new Error("Invalid response format from LLM provider");
            }

        } catch (error) {
            console.error("[AiService] Error calling LLM:", error.message);
            if (error.response) {
                console.error("Response data:", error.response.data);
            }
            throw error;
        }
    }

    getMockResponse(messages) {
        // Simple mock logic based on the last message content or system prompt
        const lastMsg = messages[messages.length - 1].content;
        const systemMsg = messages[0].content;

        // 1. Description Generation
        if (systemMsg.includes("SHORTEST POSSIBLE Vietnamese description") || systemMsg.includes("Please generate Vietnamese descriptions")) {
            return JSON.stringify({
                "table:dbo.SinhVien": { "description": "Bảng thông tin sinh viên" },
                "column:dbo.SinhVien.MaSV": { "description": "Mã số sinh viên" },
                "column:dbo.SinhVien.TenSV": { "description": "Tên sinh viên" },
                "column:dbo.SinhVien.MaLop": { "description": "Mã lớp quản lý" },
                "table:dbo.Lop": { "description": "Bảng thông tin lớp học" },
                "column:dbo.Lop.MaLop": { "description": "Mã lớp" },
                "column:dbo.Lop.TenLop": { "description": "Tên lớp học" }
            });
        }

        // 2. Planning
        if (systemMsg.includes("expert SQL analyst")) {
            return `
- Main objective: Get a list of students in class CNTT1
- Data entity: Students (SinhVien) and Classes (Lop)
- Query type: List
- Filters: Class name is 'CNTT1' (Lop.TenLop = 'CNTT1')
- Business rules: None apparent
- Time condition: None
- Aggregation: None
`;
        }

        // 3. SQL Generation
        if (systemMsg.includes("expert SQL developer")) {
            return "SELECT T1.MaSV, T1.TenSV, T2.TenLop FROM dbo.SinhVien T1 JOIN dbo.Lop T2 ON T1.MaLop = T2.MaLop WHERE T2.TenLop = N'CNTT1' ORDER BY T1.TenSV ASC";
        }

        return "{}";
    }
}

module.exports = new AiService();
