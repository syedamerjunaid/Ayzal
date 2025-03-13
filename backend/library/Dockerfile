FROM node:18-alpine

# Install file processing tools
RUN apk add --no-cache \
    poppler-utils \   # PDF processing
    ffmpeg \          # Video processing
    imagemagick       # Image processing

WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .

EXPOSE 3000
CMD ["npm", "start"]