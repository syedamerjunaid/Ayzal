FROM node:18-alpine

# Install timezone data for scheduling
RUN apk add --no-cache tzdata

WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .

ENV TZ=UTC
EXPOSE 3000
CMD ["npm", "start"]