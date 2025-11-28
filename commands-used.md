# AWS EKS Project - Commands Used

## Terraform Commands
```bash
cd terraform && terraform init
terraform validate
terraform fmt
terraform plan

# Build Docker image for testing
docker build -f docker/Dockerfile -t test-nginx .

# Run container locally for testing
docker run -d -p 8080:80 --name test-nginx-container test-nginx

# Stop and remove test container
docker stop test-nginx-container
docker rm test-nginx-container
```

## Pipeline Testing Commands
```bash
# Test for "Hello World" phrase in HTML (pipeline requirement)
grep -q "Hello World" src/index.html && echo "✅ Found Hello World phrase" || echo "❌ Hello World phrase missing"
```

## The Real Deal

```bash
terraform apply -auto-approve
aws eks update-kubeconfig --region us-east-1 --name my-cluster
kubectl get nodes

helm repo add eks https://aws.github.io/eks-charts
helm repo update
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=my-cluster --set serviceAccount.create=false --set region=us-east-1 --set vpcId=vpc-028e17e1561a19e1e
kubectl get pods -n kube-system | grep aws-load-balancer-controller