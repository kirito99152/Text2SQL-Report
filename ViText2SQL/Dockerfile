FROM node:alpine

WORKDIR /app

# Copy package.json của bootstrap để cài đặt dependencies
COPY bootstrap/package*.json ./bootstrap/

# Cài đặt công cụ build cho better-sqlite3
RUN apk add --no-cache python3 make g++

WORKDIR /app/bootstrap
RUN npm install

WORKDIR /app
COPY . .

WORKDIR /app/bootstrap
CMD ["node", "index.js"]