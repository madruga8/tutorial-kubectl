#!/bin/bash

# Step 1: Create Dockerfile
cat <<EOF > Dockerfile
FROM php:7.4-apache
COPY src/ /var/www/html/
EOF

# Step 2: Create PHP Application
mkdir src
cat <<EOF > src/index.php
<?php
echo 'Hostname: ' . gethostname();
?>
EOF

# Step 3: Create Docker Compose file
cat <<EOF > docker-compose.yml
version: '3.8'
services:
  webapp:
    build: .
    ports:
      - "80:80"
EOF

# Step 4: Kubernetes Deployment and Service Configuration
cat <<EOF > kubernetes-deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: php-webapp
spec:
  replicas: 3 # example of scalability
  selector:
    matchLabels:
      app: php-webapp
  template:
    metadata:
      labels:
        app: php-webapp
    spec:
      containers:
      - name: php-webapp
        image: [DOCKER_IMAGE_NAME]
        ports:
        - containerPort: 80
EOF

cat <<EOF > kubernetes-service.yml
apiVersion: v1
kind: Service
metadata:
  name: php-webapp-service
spec:
  type: LoadBalancer
  selector:
    app: php-webapp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF

echo "Shell script execution completed."

