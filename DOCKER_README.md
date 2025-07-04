# Project Amaan - Docker Setup

This document provides instructions for running Project Amaan as a Docker container.

## Prerequisites

- Docker installed on your system
- Docker Compose (usually comes with Docker Desktop)

## Quick Start

### Using Docker Compose (Recommended)

1. Build and start the container:
```bash
docker-compose up --build
```

2. Access the application at: http://localhost:9002

3. To run in detached mode:
```bash
docker-compose up -d --build
```

4. To stop the container:
```bash
docker-compose down
```

### Using Docker Commands

1. Build the image:
```bash
docker build -t project-amaan .
```

2. Run the container:
```bash
docker run -p 9002:3000 --name project-amaan-webapp project-amaan
```

3. Access the application at: http://localhost:9002

## Configuration

- The application runs on port 3000 inside the container
- Port 9002 is exposed on the host machine
- Logs are mounted to `./logs` directory
- The container runs in production mode

## Troubleshooting

### Container won't start
- Check if port 9002 is already in use
- Verify Docker is running
- Check container logs: `docker logs project-amaan-webapp`

### Build fails
- Ensure all dependencies are properly listed in package.json
- Check for any missing environment variables
- Verify Node.js version compatibility

## Development

For development with hot reload, you can override the command:
```bash
docker-compose run --rm -p 9002:9002 project-amaan npm run dev
```

## Environment Variables

Create a `.env.local` file for environment-specific variables:
```
# Add your environment variables here
NEXT_PUBLIC_API_URL=your_api_url
```

## Maintenance

### Update dependencies
```bash
docker-compose build --no-cache
```

### View logs
```bash
docker-compose logs -f project-amaan
```

### Access container shell
```bash
docker-compose exec project-amaan sh
