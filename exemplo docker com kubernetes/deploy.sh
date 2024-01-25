#!/bin/bash

# Define Docker image name
DOCKER_IMAGE_NAME="php-webapp"

echo "Building Docker image..."
docker build -t $DOCKER_IMAGE_NAME .

echo "Creating Docker Compose environment..."
docker-compose up -d

echo "Deploying to Kubernetes..."
kubectl apply -f kubernetes-deployment.yml
kubectl apply -f kubernetes-service.yml
kubectl apply -f hpa-file.yml

# Display status
echo "Deployment status:"
kubectl get deployments
echo "Service status:"
kubectl get services
echo "HPA status:"
kubectl get hpa

# Demonstrating the application
echo "The application is deployed. You can access it on the service's external IP (if LoadBalancer is supported)."
