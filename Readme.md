# DevOps Pipeline Project

A fully automated CI/CD pipeline that deploys a containerized Node.js application to AWS EC2 using Docker, Terraform, Nginx, and GitHub Actions.

## Architecture

```
Developer pushes code → GitHub Actions → Copies files to AWS EC2 → Docker builds app → Nginx serves on port 80
```

## Tech Stack

- **App:** Node.js + Express
- **Containerization:** Docker + Docker Compose
- **Infrastructure as Code:** Terraform (AWS EC2, Security Groups)
- **CI/CD:** GitHub Actions
- **Reverse Proxy:** Nginx
- **Server:** AWS EC2 (Ubuntu 22.04)
- **Cloud Provider:** AWS

## What Happens When I Push Code

1. GitHub Actions triggers automatically
2. Code is copied to the AWS server via SCP
3. Docker Compose rebuilds the application container
4. Nginx routes traffic from port 80 to the app
5. Zero downtime — fully automated

## Project Structure

```
devops-pipeline-project/
├── .github/workflows/
│   └── deploy.yml          # CI/CD pipeline
├── nginx/
│   └── default.conf        # Nginx reverse proxy config
├── terraform/
│   ├── main.tf             # EC2 + Security Group
│   ├── variables.tf        # Configurable variables
│   ├── outputs.tf          # Server IP output
│   └── provider.tf         # AWS provider config
├── index.js                # Node.js application
├── Dockerfile              # Container image
├── docker-compose.yml      # Multi-container setup
└── package.json            # Dependencies
```

## How to Deploy

### 1. Clone the repo

```bash
git clone https://github.com/Javed-Gulzar/devops-pipeline-project.git
cd devops-pipeline-project
```

### 2. Configure AWS

```bash
aws configure
```

### 3. Create infrastructure with Terraform

```bash
cd terraform
terraform init
terraform apply -var="key_name=your-key-name"
```

### 4. Set GitHub Secrets

Add these in your repo Settings > Secrets > Actions:

- `SERVER_IP` — Your EC2 instance public IP
- `SERVER_USER` — ubuntu
- `SSH_PRIVATE_KEY` — Your .pem file contents

### 5. Push code and auto deploy

```bash
git push origin main
```

GitHub Actions handles the rest automatically.

## Live Demo

Application is deployed and running at the EC2 instance provisioned by Terraform. Each push to the main branch triggers an automatic deployment via GitHub Actions.

## Key Features

- **Infrastructure as Code** — Server provisioned with Terraform, not manual clicks
- **Containerized** — App runs in Docker for consistency across environments
- **Automated Deployment** — Push to GitHub and the app deploys itself
- **Reverse Proxy** — Nginx handles incoming traffic and forwards to the app
- **Security** — AWS Security Groups configured for SSH, HTTP, and app ports only
- **Auto Restart** — Docker restart policy ensures the app recovers from crashes

## Author

**Javed Ahmed** — DevOps Engineer

- LinkedIn: [linkedin.com/in/javedahmmed](https://linkedin.com/in/javedahmmed)
- GitHub: [github.com/Javed-Gulzar](https://github.com/Javed-Gulzar)