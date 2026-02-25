const aiService = require('./src/services/aiService');

async function testConnection() {
    console.log("Testing connection to LLM endpoint:", aiService.endpoint);
    try {
        const messages = [
            { role: "system", content: "You are a helpful assistant." },
            { role: "user", content: "Say 'Hello, I am ready' in Vietnamese." }
        ];

        console.log("Sending request...");
        const response = await aiService.generateJson(messages);
        console.log("Response received:");
        console.log(response);
    } catch (error) {
        console.error("Test failed:");
        if (error.response) {
            console.error("Status:", error.response.status);
            console.error("Data:", error.response.data);
        } else {
            console.error("Message:", error.message);
        }
    }
}

testConnection();
