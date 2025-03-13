#!/bin/bash
DOCKER_USER="syedamerjunaid"
APP_NAME="ayzal"

# Build and push backend services
services=("auth" "payment" "library" "training" "community" "forum" "mentorship" "programs" "kubernetes")
for service in "${services[@]}"; do
  docker build -t $DOCKER_USER/${APP_NAME}-${service}:latest -f backend/$service/Dockerfile ./backend/$service
  docker push $DOCKER_USER/${APP_NAME}-${service}:latest
done

# Frontend
docker build -t $DOCKER_USER/${APP_NAME}-frontend:latest -f frontend/Dockerfile ./frontend
docker push $DOCKER_USER/${APP_NAME}-frontend:latest
