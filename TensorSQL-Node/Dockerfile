FROM node:alpine

WORKDIR /app

COPY package*.json ./

# Cài đặt công cụ build cho better-sqlite3
RUN apk add --no-cache python3 make g++

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]