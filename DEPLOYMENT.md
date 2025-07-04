# Deployment Guide

This guide covers different ways to deploy Project Amaan cybersecurity toolkit.

## 🐳 Docker Deployment (Recommended)

### Option 1: DockerHub
```bash
# Quick start
docker run -d -p 9002:9002 --name project-amaan kbinkenaid/project-amaan-webapp:latest

# With API keys
docker run -d -p 9002:9002 \
  -e HASHKILLER_API_KEY="your-key" \
  -e HAVEIBEENPWNED_API_KEY="your-key" \
  --name project-amaan \
  kbinkenaid/project-amaan-webapp:latest
```

### Option 2: GitHub Container Registry
```bash
# Quick start
docker run -d -p 9002:9002 --name project-amaan ghcr.io/kbinkenaid/project-amaan-webapp:latest

# With API keys
docker run -d -p 9002:9002 \
  -e HASHKILLER_API_KEY="your-key" \
  -e HAVEIBEENPWNED_API_KEY="your-key" \
  --name project-amaan \
  ghcr.io/kbinkenaid/project-amaan-webapp:latest
```

### Option 3: Docker Compose
Create `docker-compose.yml`:
```yaml
version: '3.8'
services:
  project-amaan:
    image: kbinkenaid/project-amaan-webapp:latest
    container_name: project-amaan-webapp
    ports:
      - "9002:9002"
    environment:
      - NODE_ENV=production
      - HASHKILLER_API_KEY=${HASHKILLER_API_KEY}
      - HAVEIBEENPWNED_API_KEY=${HAVEIBEENPWNED_API_KEY}
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:9002"]
      interval: 30s
      timeout: 10s
      retries: 3
```

Run with:
```bash
docker-compose up -d
```

## 🏗️ Local Development

### Prerequisites
- Node.js 18 or higher
- npm or yarn

### Setup
```bash
# Clone repository
git clone https://github.com/kbinkenaid/project-amaan-webapp.git
cd project-amaan-webapp

# Install dependencies
npm install

# Start development server
npm run dev

# Access at http://localhost:9002
```

### Build for Production
```bash
# Build the application
npm run build

# Preview production build
npm run preview
```

## ☁️ Cloud Deployment

### AWS ECS
1. Push image to ECR or use public DockerHub image
2. Create ECS task definition with image `kbinkenaid/project-amaan-webapp:latest`
3. Configure port mapping: 9002
4. Set environment variables for API keys
5. Deploy to ECS cluster

### Google Cloud Run
```bash
# Deploy from DockerHub
gcloud run deploy project-amaan \
  --image=kbinkenaid/project-amaan-webapp:latest \
  --port=9002 \
  --allow-unauthenticated \
  --region=us-central1
```

### Azure Container Instances
```bash
# Deploy to Azure
az container create \
  --resource-group myResourceGroup \
  --name project-amaan \
  --image kbinkenaid/project-amaan-webapp:latest \
  --ports 9002 \
  --environment-variables HASHKILLER_API_KEY=your-key HAVEIBEENPWNED_API_KEY=your-key
```

### DigitalOcean App Platform
1. Create new app from DockerHub
2. Use image: `kbinkenaid/project-amaan-webapp:latest`
3. Set port: 9002
4. Configure environment variables
5. Deploy

## 🔧 Configuration

### Environment Variables
| Variable | Description | Required |
|----------|-------------|----------|
| `NODE_ENV` | Environment mode | No (defaults to production) |
| `HASHKILLER_API_KEY` | HashKiller service API key | No (demo mode available) |
| `HAVEIBEENPWNED_API_KEY` | HaveIBeenPwned API key | No (demo mode available) |

### Port Configuration
- Default internal port: 9002
- Map to any external port: `-p <external>:9002`

### Health Checks
The application includes built-in health monitoring:
- Endpoint: `http://localhost:9002/health`
- Returns: Application status and version

## 🚀 Production Considerations

### Security
- Use environment variables for API keys
- Enable HTTPS with reverse proxy (nginx, traefik)
- Implement rate limiting at load balancer level
- Regular security updates

### Monitoring
- Container logs: `docker logs -f project-amaan`
- Health endpoint: `/health`
- Resource monitoring via Docker stats

### Scaling
- Horizontal scaling: Deploy multiple containers behind load balancer
- Vertical scaling: Increase container resources
- Auto-scaling: Use cloud provider auto-scaling features

### Backup
- No persistent data stored in container
- API keys should be backed up securely
- Configuration files should be version controlled

## 🔍 Troubleshooting

### Common Issues
1. **Port already in use**: Change external port mapping
2. **API keys not working**: Verify environment variable names
3. **Container won't start**: Check logs with `docker logs project-amaan`
4. **Performance issues**: Increase container memory allocation

### Debug Mode
```bash
# Run with debug output
docker run -d -p 9002:9002 \
  -e NODE_ENV=development \
  --name project-amaan-debug \
  kbinkenaid/project-amaan-webapp:latest

# View detailed logs
docker logs -f project-amaan-debug
```

## 📞 Support

- **Issues**: https://github.com/kbinkenaid/project-amaan-webapp/issues
- **Documentation**: https://github.com/kbinkenaid/project-amaan-webapp
- **Docker Images**: 
  - DockerHub: https://hub.docker.com/r/kbinkenaid/project-amaan-webapp
  - GHCR: https://github.com/kbinkenaid/project-amaan-webapp/pkgs/container/project-amaan-webapp