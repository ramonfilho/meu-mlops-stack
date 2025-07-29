FROM tensorflow/tensorflow:2.10.0-gpu

ARG WORKDIR=/mlflow_tutorial
RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}

# Install venv, create virtual environment, and install dependencies in a single layer
RUN apt-get update && \
    apt-get install -y python3-venv build-essential libatlas-base-dev gfortran && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir --break-system-packages matplotlib scikit-learn numpy

# Add the virtual environment to the PATH
ENV PATH="/opt/venv/bin:$PATH"

COPY model_gpu.py ${WORKDIR}/model.py

CMD ["/opt/venv/bin/python", "model.py"]
