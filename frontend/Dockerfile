# Stage 1: Build
FROM node:18-alpine AS builder

RUN apk add --no-cache \
    python3 \
    make \
    g++

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Production
FROM nginx:alpine

# Install runtime dependencies
RUN apk add --no-cache \
    curl \
    tzdata

COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]