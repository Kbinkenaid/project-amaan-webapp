# Project Amaan - Cybersecurity Toolkit

A comprehensive web-based security tools suite for penetration testers, security researchers, and cybersecurity professionals.

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)
![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)
![Vite](https://img.shields.io/badge/vite-%23646CFF.svg?style=for-the-badge&logo=vite&logoColor=white)

## 🛡️ Features

### Security Tools
- **🔍 Breach Detection**: HaveIBeenPwned integration for email/domain breach checking
- **🌐 Network Tools**: Port scanner and WHOIS/DNS lookup utilities
- **📝 Encoding Suite**: Base64, URL, HTML encoding/decoding with plain text extraction
- **🔑 API Management**: Centralized API key configuration

### User Experience
- **🎨 Modern UI**: Professional dark/light theme interface
- **📱 Responsive Design**: Works on desktop and mobile devices
- **⚡ Fast Performance**: Built with React, TypeScript, and Vite
- **🔧 Easy Setup**: One-command Docker deployment

## 🚀 Quick Start

### Using Docker (Recommended)

#### From DockerHub
```bash
# Pull and run the latest image
docker run -d -p 9002:9002 --name project-amaan kbinkenaid/project-amaan-webapp:latest

# Access the application
open http://localhost:9002
```

#### From GitHub Container Registry
```bash
# Pull and run the latest image
docker run -d -p 9002:9002 --name project-amaan ghcr.io/kbinkenaid/project-amaan-webapp:latest

# Access the application
open http://localhost:9002
```

### Using Docker Compose
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
```

### Local Development
```bash
# Clone the repository
git clone https://github.com/kbinkenaid/project-amaan-webapp.git
cd project-amaan-webapp

# Install dependencies
npm install

# Start development server
npm run dev

# Access at http://localhost:9002
```

## 🔧 Configuration

### Environment Variables
- `HASHKILLER_API_KEY`: API key for HashKiller service (optional)
- `HAVEIBEENPWNED_API_KEY`: API key for HaveIBeenPwned service (optional)
- `NODE_ENV`: Environment mode (production/development)

### Custom Port
```bash
# Run on custom port (e.g., 8080)
docker run -d -p 8080:9002 --name project-amaan kbinkenaid/project-amaan-webapp:latest
```

## 📋 Tool Categories

### 🔍 Breach Detection
- **Email Breach Checking**: Check if email addresses have been compromised in data breaches
- **Domain Analysis**: Analyze domains for security breaches
- **Demo Mode**: Full functionality available without API key for testing

### 🔐 Hash Cracking
- **Supported Algorithms**: MD5, SHA1, SHA256, SHA512, and more
- **Multiple Services**: Integration with HashKiller, CrackStation, and Hashes.com
- **Batch Processing**: Crack multiple hashes simultaneously

### 🌐 Network Analysis
- **Port Scanning**: Scan IP addresses and domains for open ports
- **WHOIS Lookup**: Get domain registration and ownership information
- **DNS Analysis**: Resolve DNS records and analyze domain infrastructure

### 📝 Encoding/Decoding
- **Base64**: Encode and decode Base64 strings
- **URL Encoding**: Handle URL encoding and decoding
- **HTML Entities**: Convert HTML entities to readable text
- **Plain Text Extraction**: Extract and format readable text from encoded content

## 🛠️ Tech Stack

- **Frontend**: React 18, TypeScript, Tailwind CSS
- **Build Tool**: Vite
- **UI Components**: Shadcn/ui, Radix UI
- **Icons**: Lucide React
- **Container**: Docker (Node.js 18 Alpine)
- **CI/CD**: GitHub Actions

## 📊 Container Details

- **Base Image**: node:18-alpine
- **Size**: ~790MB
- **Architecture**: Multi-platform support (linux/amd64, linux/arm64)
- **Port**: 9002 (internal)
- **Health Check**: Built-in application health monitoring

## 🔒 Security Features

- **No Data Storage**: No sensitive data stored in container
- **Environment Variables**: Secure API key configuration
- **CORS Protection**: Cross-origin request protection enabled
- **Input Validation**: Comprehensive input sanitization
- **Rate Limiting**: Built-in request rate limiting

## 📖 Usage Examples

### Basic Usage
```bash
# Start the application
docker run -d -p 9002:9002 --name project-amaan kbinkenaid/project-amaan-webapp:latest

# View logs
docker logs -f project-amaan

# Stop the application
docker stop project-amaan
```

### With API Keys
```bash
docker run -d -p 9002:9002 \
  -e HASHKILLER_API_KEY="your-hashkiller-key" \
  -e HAVEIBEENPWNED_API_KEY="your-hibp-key" \
  --name project-amaan \
  kbinkenaid/project-amaan-webapp:latest
```

### Development Mode
```bash
# Clone and setup
git clone https://github.com/kbinkenaid/project-amaan-webapp.git
cd project-amaan-webapp
npm install

# Start development server with hot reload
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

## 🚀 Deployment

### GitHub Actions
This repository includes automated Docker image building and publishing via GitHub Actions. Images are automatically built and pushed to both DockerHub and GitHub Container Registry on every push to the main branch.

### Manual Build
```bash
# Build the Docker image
docker build -t project-amaan-webapp .

# Run locally
docker run -d -p 9002:9002 project-amaan-webapp
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is intended for educational and research purposes only. Use responsibly and in accordance with applicable laws and regulations.

## ⚠️ Disclaimer

This tool is designed for legitimate security research and testing purposes only. Users are responsible for ensuring they have proper authorization before testing any systems or networks. The authors are not responsible for any misuse of this tool.

## 🔗 Links

- **DockerHub**: https://hub.docker.com/r/kbinkenaid/project-amaan-webapp
- **GitHub Container Registry**: https://github.com/kbinkenaid/project-amaan-webapp/pkgs/container/project-amaan-webapp
- **Issues**: https://github.com/kbinkenaid/project-amaan-webapp/issues
- **Releases**: https://github.com/kbinkenaid/project-amaan-webapp/releases

---

**Perfect for**: Security assessments, penetration testing, cybersecurity research, and educational purposes.
