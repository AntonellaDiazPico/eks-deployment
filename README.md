# EKS Deployment Project

## 🏗️ Overview

This project demonstrates a complete microservices architecture deployed on AWS EKS with automated CI/CD pipelines. It showcases infrastructure as code, Kubernetes orchestration, application load balancing, and monitoring capabilities.

**Live Application:** [http://k8s-default-nginxing-8ca6de4cfc-808164679.us-east-1.elb.amazonaws.com](http://k8s-default-nginxing-8ca6de4cfc-808164679.us-east-1.elb.amazonaws.com)

## 🎯 Architecture

### Infrastructure Components

```
Internet
    ↓
Application Load Balancer (Public Subnets)
    ↓
Kubernetes Service (ClusterIP)
    ↓
Nginx Pods (Private Subnets)
```

### AWS Resources Deployed

- **VPC**: Custom VPC with 2 public and 2 private subnets across 2 AZs
- **EKS Cluster**: Kubernetes cluster with 2 worker nodes
- **ECR Repository**: Container registry for custom application images
- **Application Load Balancer**: Internet-facing load balancer for external access
- **IAM Roles**: IRSA configuration for service accounts

## 🚀 Key Features

### ✅ Infrastructure as Code (Terraform)
- Complete AWS infrastructure provisioned via Terraform
- VPC with proper subnet architecture
- EKS cluster with worker node groups
- IAM roles and policies for secure access

### ✅ Kubernetes Orchestration
- **Deployment**: Nginx application with 2 replicas in private subnets
- **Service**: ClusterIP service for internal communication
- **Ingress**: ALB ingress controller for external access
- **DaemonSet**: CloudWatch agent on each worker node
- **Service Accounts**: IRSA configuration for AWS permissions

### ✅ CI/CD Pipeline (GitHub Actions)
- Automated detection of "Hello World" phrase in source code
- Manual approval gate before deployment
- Docker image build and push to ECR
- Automatic Kubernetes deployment updates
- Rolling updates with zero downtime

### ✅ Security Best Practices
- Pods deployed in private subnets only
- Public ALB routes traffic to private pods
- IRSA for secure AWS API access
- Least privilege IAM policies

## 📁 Project Structure

```
├── terraform/           # Infrastructure as Code
│   ├── main.tf         # VPC, subnets, gateways
│   ├── eks.tf          # EKS cluster configuration
│   ├── iam.tf          # IAM roles and policies
│   └── ecr.tf          # Container registry
├── k8s/                # Kubernetes manifests
│   ├── deployments/    # Application deployments
│   ├── services/       # Kubernetes services
│   ├── ingress/        # Load balancer configuration
│   ├── daemonsets/     # CloudWatch monitoring
│   └── serviceaccount/ # IRSA configuration
├── .github/workflows/  # CI/CD pipeline
├── docker/             # Container configuration
└── src/                # Application source code
```

## 🛠️ Technologies Used

- **Infrastructure**: AWS (VPC, EKS, ECR, ALB, CloudWatch)
- **Orchestration**: Kubernetes, Helm
- **CI/CD**: GitHub Actions
- **Infrastructure as Code**: Terraform
- **Containerization**: Docker
- **Monitoring**: CloudWatch, DaemonSets