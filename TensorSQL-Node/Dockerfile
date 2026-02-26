FROM node:18

WORKDIR /app

COPY package*.json ./

# Cài đặt công cụ build cho các module native (như sqlite3)
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

RUN npm install

COPY . .

EXPOSE 5002

CMD ["node", "index.js"]