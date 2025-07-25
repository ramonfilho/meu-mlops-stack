#!/bin/bash

export ARTIFACT_REGISTRY_REPO="myrepo"
export PROJECT_ID=$(gcloud config get-value project)
export FLEX_BUCKET="flex_templates_my_pipeline"
export TEMPLATE_FILE="normal_window_template.json"

echo "*************************"
echo "Build Flex Template"
gcloud dataflow flex-template build gs://${FLEX_BUCKET}/${TEMPLATE_FILE} \
--image-gcr-path us-central1-docker.pkg.dev/smart-ads-451319/${ARTIFACT_REGISTRY_REPO}/window_pipeline:latest \
--sdk-language "PYTHON" \
--metadata-file metadata/metadata.json \
--project smart-ads-451319 \
--worker-region us-central1 \
--env  "FLEX_TEMPLATE_PYTHON_REQUIREMENTS_FILE=requirements.txt" \
--env "FLEX_TEMPLATE_PYTHON_PY_FILE=pipeline/windowing_pipeline.py" \
--env "FLEX_TEMPLATE_PYTHON_SETUP_FILE=setup.py" \
--flex-template-base-image "PYTHON3" \
--py-path "."
