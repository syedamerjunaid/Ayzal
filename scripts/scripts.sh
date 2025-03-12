#!/bin/bash

# Root directories
mkdir -p Ayzal/{frontend,backend,helm,k8s,scripts,.github/workflows}

# Frontend
mkdir -p Ayzal/frontend/{public,src/{components,pages,services,styles}}

# Backend services
services=("auth" "community" "forum" "library" "mentorship" "payment" "programs" "training")
for service in "${services[@]}"; do
  mkdir -p Ayzal/backend/$service/{src,test}
  touch Ayzal/backend/$service/{src/main.ts,src/${service}.controller.ts,Dockerfile,package.json}
done

# Helm Charts
mkdir -p Ayzal/helm/{frontend,backend}
for service in "${services[@]}"; do
  mkdir -p Ayzal/helm/backend/$service/templates
  touch Ayzal/helm/backend/$service/{Chart.yaml,values.yaml}
done

# Kubernetes
touch Ayzal/k8s/ingress.yaml

echo "Folder structure created!"
