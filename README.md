# EKS Deployment Project

## 🚀 Overview

Simple AWS EKS deployment with automated CI/CD pipeline and CloudWatch monitoring.

**Live Application:** http://k8s-default-nginxing-8ca6de4cfc-808164679.us-east-1.elb.amazonaws.com

## 📁 Project Structure

```
├── terraform/           # Infrastructure as Code
├── k8s/                # Kubernetes manifests
├── docker/             # Container configuration
├── src/                # Application source code
└── .github/workflows/  # CI/CD pipeline
```

## 🏗️ Architecture

```
Internet → ALB (Public Subnets) → Kubernetes Service → Nginx Pods (Private Subnets)
```

**Infrastructure:**
- VPC with 2 public + 2 private subnets (multi-AZ)
- EKS cluster with 2 worker nodes
- Application Load Balancer for external access
- ECR for container registry

## ✅ What's Deployed

### Application
- **2 nginx pods** running in private subnets
- **ClusterIP service** for internal communication
- **ALB ingress** routing external traffic

### Monitoring
- **CloudWatch Observability Add-on** (official AWS EKS add-on)
- **Container Insights** for metrics and logs
- **IRSA** for secure AWS permissions

### CI/CD
- **GitHub Actions** pipeline
- **Automated "Hello World" detection**
- **Manual approval** for production deployments
- **ECR integration** for container builds

## 🚀 Quick Start

### Deploy Infrastructure
```bash
cd terraform
terraform init
terraform apply
```

### Configure kubectl
```bash
aws eks update-kubeconfig --region us-east-1 --name my-cluster
```

### Deploy Application
```bash
kubectl apply -f k8s/  # /deamonset is deprecated and replaced with add-on
```

## 🔧 Technologies

- **Cloud:** AWS (VPC, EKS, ECR, ALB, CloudWatch)
- **Container:** Docker, Kubernetes
- **Infrastructure:** Terraform
- **CI/CD:** GitHub Actions
- **Monitoring:** CloudWatch Observability Add-on

## 📊 Monitoring

CloudWatch monitoring is handled by the official AWS EKS add-on which provides:
- Container metrics and logs
- Application insights
- Node and cluster metrics
- Automated log aggregation

## 🔒 Security

- Pods deployed in private subnets only
- IRSA for AWS service authentication
- Network isolation between tiers
- Container security best practices

---

**Contact:** Antonella Diaz Pico