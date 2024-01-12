#!/bin/bash

# Start Minikube if not already running
echo "Starting Minikube..."
minikube start

# Start Docker Compose environment
echo "Starting Docker Compose environment..."
docker-compose up -d

# Display current Kubernetes deployment, service, and HPA status
echo "Current Kubernetes deployment status:"
kubectl get deployments

echo "Current Kubernetes service status:"
kubectl get services

echo "Current Kubernetes HPA status:"
kubectl get hpa

# Access Minikube service
echo "Attempting to open the Minikube service in the browser..."
minikube service php-webapp-service
