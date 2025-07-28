#!/bin/bash

export ARTIFACT_REGISTRY_REPO="model-gpu-vertexai"
export PROJECT_ID=$(gcloud config get-value project)

gcloud artifacts repositories create ${ARTIFACT_REGISTRY_REPO} \
    --repository-format=docker \
    --location=us-central1 \
    --description="Repo for vertexAI models" \
    --async


echo "Build Docker image"
docker build --no-cache -t model_gpu -f chapter_2_model_training/04_vertexai_gpu/model/docker/Dockerfile chapter_2_model_training/04_vertexai_gpu/model
echo "Tag Docker image"
docker tag model_gpu us-central1-docker.pkg.dev/${PROJECT_ID}/${ARTIFACT_REGISTRY_REPO}/model_gpu:latest
echo "Push Docker image"
gcloud auth configure-docker us-central1-docker.pkg.dev
docker push us-central1-docker.pkg.dev/${PROJECT_ID}/${ARTIFACT_REGISTRY_REPO}/model_gpu:latest
