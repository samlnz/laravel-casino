# Build stage: install deps and build
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files from casino and install deps
COPY casino/package*.json ./
RUN npm ci

# Copy the casino frontend & build
COPY casino/ ./
RUN npm run build

FROM node:18-alpine AS serve
WORKDIR /app
RUN npm i -g http-server
COPY --from=builder /app/public ./public
EXPOSE 3000
CMD ["sh","-c","http-server public -p ${PORT:-3000}"]