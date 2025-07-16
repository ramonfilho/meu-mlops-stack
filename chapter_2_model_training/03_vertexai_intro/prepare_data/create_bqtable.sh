#!/bin/bash

# Change to the script's directory
cd "$(dirname "$0")"

# install
pip3 install -r requirements.txt

# run the code
python3 generate_data.py

# copy the file to the bucket
gsutil cp fake_dataset.csv gs://first_vertex_ai_kfp_1/fake_dataset.csv


bq --location=EU mk -d \
    --default_table_expiration 36000 \
    --description "VertexAI dataset" \
    learning_vertexai
# create a table from the file
bq load --source_format=CSV --autodetect learning_vertexai.fake_dataset_1  gs://first_vertex_ai_kfp_1/fake_dataset.csv
