#!/bin/bash

# Root directory
K8S_DIR="k8s"

# Create base folders
mkdir -p $K8S_DIR/frontend $K8S_DIR/backend $K8S_DIR/ingress

# Frontend files
touch $K8S_DIR/frontend/frontend-deployment.yaml
touch $K8S_DIR/frontend/frontend-service.yaml

# Ingress file
touch $K8S_DIR/ingress/ingress.yaml

# Backend services
services=("auth" "community" "forum" "kubernetes" "library" "mentorship" "payment" "programs" "training")

for service in "${services[@]}"; do
  # Create service folder and files
  mkdir -p $K8S_DIR/backend/$service
  touch $K8S_DIR/backend/$service/${service}-deployment.yaml
  touch $K8S_DIR/backend/$service/${service}-service.yaml
done

echo "Kubernetes folder structure created!"
