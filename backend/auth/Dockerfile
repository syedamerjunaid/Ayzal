# Use Node.js LTS
FROM node:18-alpine

# Install security-related dependencies
RUN apk add --no-cache openssl

# Set working directory
WORKDIR /app

# Copy package files for dependency installation
COPY package*.json ./
  
# Install production dependencies
RUN npm install --only=production

# Copy source code
COPY . .

# Generate SSL keys (if needed)
RUN openssl genrsa -out ./config/private.key 2048 && \
    openssl rsa -in ./config/private.key -pubout -out ./config/public.key

EXPOSE 3000
CMD ["npm", "run", "start:prod"]