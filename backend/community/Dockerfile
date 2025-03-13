FROM node:18-alpine

# Install build tools for native modules
RUN apk add --no-cache python3 make g++

WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .

EXPOSE 3000
CMD ["npm", "run", "start:prod"]