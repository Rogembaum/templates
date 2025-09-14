# Simple Node.js App with Jenkins Pipeline

A simple Node.js project with configured Jenkins CI/CD pipeline for testing and deployment.

## Description

- **Application**: Express.js server with two endpoints (/ and /health)
- **Testing**: Basic Node.js tests
- **Containerization**: Docker image based on Node.js 20 Alpine
- **CI/CD**: Jenkins pipeline with automatic build and testing

## Quick Start

### Local Application Launch

`ash
# Install dependencies
npm install

# Start application
npm start

# Run tests
npm test
`

Application will be available at: http://localhost:3000

### Docker Launch

`ash
# Build image
docker build -t myapp .

# Run container
docker run -p 3000:3000 myapp
`

### Jenkins with Docker Compose

`ash
# Start Jenkins with pre-installed plugins
docker-compose up -d

# Access Jenkins
# URL: http://localhost:8080
# Login: admin
# Password: admin
`

## API Endpoints

- GET / - Main page with greeting and timestamp
- GET /health - Application health check

## Jenkins Pipeline

Pipeline executes the following stages:

1. **Preflight** - Working directory check
2. **Install deps** - Install npm dependencies
3. **Test** - Run tests
4. **Docker Build & Smoke** - Build Docker image and smoke testing

## Project Structure

`
 app.js              # Main Express.js application
 test.js             # Application tests
 package.json        # Dependencies and scripts
 Dockerfile          # Application Docker image
 pipe.jenkins        # Jenkins pipeline
 docker-compose.yaml # Jenkins with Docker
 Dockerfile.jenkins  # Jenkins image with plugins
 jenkins.yaml        # Jenkins configuration
`

## Requirements

- Node.js 20+
- Docker
- Docker Compose (for Jenkins)
