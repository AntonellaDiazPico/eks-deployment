# AWS EKS setup with basic infrastructure and CI/CD pipeline.

## Quick Start

### 1. Deploy Infrastructure
```bash
cd terraform
terraform init
terraform apply
```

### 2. Deploy Application
```bash
aws eks update-kubeconfig --region us-east-1 --name anto-test-cluster
kubectl apply -f k8s/
```

### 3. Access Application
```bash
kubectl get ingress
# Use the load balancer URL to access the app
```

## What's Included

- **VPC**: 1 public subnet, 2 private subnets
- **EKS**: Simple cluster with 2 worker nodes
- **App**: Basic Nginx deployment (2 pods minimum)
- **Monitoring**: CloudWatch agent on each node
- **CI/CD**: GitHub Actions for automated deployment

## Architecture

```
Internet → Load Balancer (Public Subnet) → Nginx Pods (Private Subnets)
```

The pipeline checks for "Hello World" in the HTML, builds a Docker image, and updates the pods automatically.