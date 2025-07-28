# create a virtual environment
python3 -m venv chapter_2_model_training/04_vertexai_gpu/venv
chapter_2_model_training/04_vertexai_gpu/venv/bin/pip install "cython<3.0.0" wheel
chapter_2_model_training/04_vertexai_gpu/venv/bin/pip install "pyyaml==5.4.1" --no-build-isolation
chapter_2_model_training/04_vertexai_gpu/venv/bin/pip install -r chapter_2_model_training/04_vertexai_gpu/requirements.txt

chapter_2_model_training/04_vertexai_gpu/venv/bin/python chapter_2_model_training/04_vertexai_gpu/pipeline/pipeline_with_vm.py

