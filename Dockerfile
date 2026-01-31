# Dockerfile

# Specify the base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --silent || npm install --silent

# Copy the rest of the application files
COPY . .

# Build the frontend
RUN npm run build

# Install http-server to serve the public directory
RUN npm install -g http-server

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["http-server", "public", "-p", "8080"]