FROM node:18-alpine

# Install SSL tools for secure communication
RUN apk add --no-cache ca-certificates

WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .

EXPOSE 3000
CMD ["node", "dist/main.js"]  # For compiled TS/JS