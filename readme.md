# Navigate to the directory containing the Dockerfile and docker-compose.yml
cd /path/to/your/files

# Build the Docker image using Docker Compose
docker-compose build

# Run the container
docker-compose up


Access the Application:

minikube start



# Apply the Deployment
kubectl apply -f kubernetes-deployment.yml

# Apply the Service
kubectl apply -f kubernetes-service.yml

# Apply the Horizontal Pod Autoscaler
kubectl apply -f hpa-file.yml





# Check the deployment
kubectl get deployments

# Check the service
kubectl get services

# Check the HPA
kubectl get hpa




Access the Application:


minikube service php-webapp-service



Monitor and Test Scaling:

kubectl get pods -w



Cleanup:
After you're done testing, you can stop and remove the resources:



# Stop Docker Compose services
docker-compose down

# Delete Kubernetes resources
kubectl delete -f kubernetes-deployment.yml
kubectl delete -f kubernetes-service.yml
kubectl delete -f hpa-file.yml

# If using Minikube and you want to stop it
minikube stop


