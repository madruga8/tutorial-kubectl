#!/bin/bash

# Define o nome da imagem Docker
DOCKER_IMAGE_NAME="php-webapp"

# Inicia o Minikube, se ainda não estiver em execução
echo "Iniciando o Minikube..."
minikube start

# Configura o ambiente do Docker para usar o daemon do Minikube
echo "Configurando o ambiente do Docker para o Minikube..."
eval $(minikube docker-env)

# Para e remove o ambiente do Docker Compose
echo "Parando e removendo o ambiente do Docker Compose..."
docker-compose down

# Deleta implantações, serviços e HPA existentes no Kubernetes
echo "Excluindo implantações, serviços e HPA no Kubernetes..."
kubectl delete deployment php-webapp
kubectl delete service php-webapp-service
kubectl delete hpa php-webapp-hpa

# Constrói a imagem Docker usando o daemon do Minikube
echo "Construindo a imagem Docker..."
docker build -t $DOCKER_IMAGE_NAME .

# Cria o ambiente do Docker Compose
echo "Criando o ambiente do Docker Compose..."
docker-compose up -d

# Implanta no Kubernetes
echo "Implantando no Kubernetes..."
kubectl apply -f kubernetes-deployment.yml
kubectl apply -f kubernetes-service.yml
kubectl apply -f hpa-file.yml

# Exibe o status da implantação
echo "Status da implantação:"
kubectl get deployments
echo "Status do serviço:"
kubectl get services
echo "Status do HPA:"
kubectl get hpa

# Exibe informações de acesso à aplicação
echo "A aplicação foi implantada. Você pode acessá-la no IP externo do serviço (se o LoadBalancer for suportado)."

# Abre o serviço Minikube para a aplicação
minikube service php-webapp-service
