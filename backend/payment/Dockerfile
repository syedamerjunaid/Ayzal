FROM node:18-alpine

# PostgreSQL client libraries
RUN apk add --no-cache \
    postgresql-client \
    postgresql-dev

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .

EXPOSE 3000
CMD ["node", "dist/main.js"]