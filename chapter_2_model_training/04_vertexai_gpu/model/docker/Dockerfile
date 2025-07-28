FROM tensorflow/tensorflow:2.10.0-gpu

ARG WORKDIR=/mlflow_tutorial
RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}

# Create a virtual environment and update pip
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies within the virtual environment
RUN pip install --no-cache-dir matplotlib scikit-learn numpy

COPY model_gpu.py ${WORKDIR}/model.py

CMD ["python", "model.py"]
