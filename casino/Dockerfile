# Build stage: install deps and build assets
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files and install deps
COPY package*.json ./
RUN npm ci

# Copy frontend sources and build
COPY . .
RUN npm run build

# Serve stage: lightweight static server
FROM node:18-alpine AS serve
WORKDIR /app
RUN npm i -g http-server
# Copy built public directory from builder
COPY --from=builder /app/public ./public

EXPOSE 3000
# Railway will set $PORT at runtime; fallback to 3000 for local test
CMD ["sh", "-c", "http-server public -p ${PORT:-3000}"]