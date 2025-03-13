FROM node:18-alpine

# Security & SSL dependencies
RUN apk add --no-cache \
    openssl \
    libressl-dev \
    && openssl genrsa -out /tmp/private.pem 2048 \
    && openssl rsa -in /tmp/private.pem -pubout -out /tmp/public.pem

WORKDIR /app
COPY package*.json ./
RUN npm install -g jsonlint && \
    jsonlint -q package.json && \
    npm ci --omit=dev
COPY . .

EXPOSE 3000
CMD ["node", "dist/main.js"]