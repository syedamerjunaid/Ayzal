FROM node:18-alpine

# Media processing stack
RUN apk add --no-cache \
    ffmpeg \
    imagemagick \
    poppler-utils \
    ghostscript

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .

EXPOSE 3000
CMD ["npm", "start"]