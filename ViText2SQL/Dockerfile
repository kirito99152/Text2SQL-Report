FROM node:20-alpine

WORKDIR /app

# Copy application code (excluding node_modules via .dockerignore)
COPY . .

# Cài đặt công cụ build cho better-sqlite3
RUN apk add --no-cache python3 make g++

WORKDIR /app/bootstrap
RUN npm install

CMD ["node", "index.js"]