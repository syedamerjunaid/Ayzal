# Use Node.js LTS with Alpine (lightweight)
FROM node:18-alpine

# Install system dependencies (adjust per service)
RUN apk add --no-cache \
    build-base \
    python3 \
    git \
    openssl \
    ca-certificates \
    # Cleanup cache
    && rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /app

# Copy package files first for layer caching
COPY package.json package-lock.json* ./

# Validate JSON syntax before installation
RUN npm install -g jsonlint && \
    jsonlint -q package.json && \
    if [ -f package-lock.json ]; then \
      npm ci --omit=dev; \
    else \
      npm install --omit=dev; \
    fi && \
    npm cache clean --force

# Copy source code
COPY . .

# Build step for TypeScript projects
RUN if [ -f tsconfig.json ]; then \
      npm run build; \
    fi

# Set production environment
ENV NODE_ENV=production

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD node healthcheck.js

EXPOSE 3000
CMD ["npm", "run", "start:prod"]