#!/bin/bash

# Define Docker image name
DOCKER_IMAGE_NAME="php-webapp"

# Start Minikube if not already running
echo "Starting Minikube..."
minikube start

# Configure your shell to use Minikube's Docker daemon
echo "Setting up Docker environment for Minikube..."
eval $(minikube docker-env)

# Stop and remove Docker Compose environment
echo "Stopping and removing Docker Compose environment..."
docker-compose down

# Delete existing Kubernetes deployments, services, and HPA
echo "Deleting Kubernetes deployments, services, and HPA..."
kubectl delete deployment php-webapp
kubectl delete service php-webapp-service
kubectl delete hpa php-webapp-hpa

# Build Docker image using Minikube's Docker daemon
echo "Building Docker image..."
docker build -t $DOCKER_IMAGE_NAME .

# Create Docker Compose environment
echo "Creating Docker Compose environment..."
docker-compose up -d

# Deploy to Kubernetes
echo "Deploying to Kubernetes..."
kubectl apply -f kubernetes-deployment.yml
kubectl apply -f kubernetes-service.yml
kubectl apply -f hpa-file.yml

# Display deployment status
echo "Deployment status:"
kubectl get deployments
echo "Service status:"
kubectl get services
echo "HPA status:"
kubectl get hpa

# Display application access information
echo "The application is deployed. You can access it on the service's external IP (if LoadBalancer is supported)."



minikube service php-webapp-service