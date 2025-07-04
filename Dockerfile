# Use Node.js 18 Alpine for smaller image size
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Environment variables for API keys
ENV HASHKILLER_API_KEY=""
ENV HAVEIBEENPWNED_API_KEY=""

# Copy package files first for better caching
COPY package*.json ./

# Install all dependencies (including dev dependencies for build)
RUN npm ci

# Copy source code
COPY . .

# Build the application with production settings
RUN npm run build

# Expose port 9002 (matching your dev port)
EXPOSE 9002

# Start the application
CMD ["npm", "run", "preview"]
