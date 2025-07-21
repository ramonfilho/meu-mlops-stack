#!/bin/bash

export ARTIFACT_REGISTRY_REPO="randomforest-vertexai"
export PROJECT_ID=$(gcloud config get-value project)
export IMAGE_TAG=$(date +%Y%m%d-%H%M%S) 
export IMAGE_NAME="randomforest_vertexai"
export IMAGE_URI="us-central1-docker.pkg.dev/${PROJECT_ID}/${ARTIFACT_REGISTRY_REPO}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "Build Docker image with tag: ${IMAGE_TAG} for amd64 platform"
# Constrói a imagem para a plataforma linux/amd64 e faz o push direto para o registry
docker buildx build --platform linux/amd64 -t ${IMAGE_URI} -f docker/Dockerfile . --push

echo "Docker image pushed successfully"
