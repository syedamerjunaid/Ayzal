# Stage 1: Build the frontend
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build  # Replace with your framework's build command (e.g., Next.js, React)

# Stage 2: Serve the frontend
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf  # Add if you have custom NGINX config
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]