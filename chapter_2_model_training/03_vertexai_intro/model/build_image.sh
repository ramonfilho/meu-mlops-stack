#!/bin/bash

export ARTIFACT_REGISTRY_REPO="randomforest-vertexai"
export PROJECT_ID=$(gcloud config get-value project)
export IMAGE_TAG=$(date +%Y%m%d-%H%M%S) 
export IMAGE_NAME="randomforest_vertexai"
export IMAGE_URI="us-central1-docker.pkg.dev/${PROJECT_ID}/${ARTIFACT_REGISTRY_REPO}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "Build Docker image with tag: ${IMAGE_TAG}"
# Constrói a imagem já com o nome e a tag de destino
docker build --no-cache -t ${IMAGE_URI} -f docker/Dockerfile .
echo "Push Docker image"
gcloud auth configure-docker us-central1-docker.pkg.dev
docker push ${IMAGE_URI}
