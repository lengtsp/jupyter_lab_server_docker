FROM nvidia/cuda:11.8.0-runtime-ubuntu20.04

# Install basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && bash ~/miniconda.sh -b -p /opt/conda \
    && rm ~/miniconda.sh

# Add conda to path and initialize
ENV PATH=/opt/conda/bin:/opt/conda/envs/test1/bin:$PATH

# Create conda environment and install packages in a single layer
RUN conda create -n test1 python=3.9 ipykernel -y \
    && conda install -n test1 -y \
        jupyter \
        jupyterlab \
        pandas \
        numpy \
        scikit-learn \
    && conda run -n test1 pip install \
        torch \
        torchvision \
        torchaudio \
        langchain \
        langchain-community \
        llama-index \
        transformers \
        sentence-transformers \
        chromadb \
        beautifulsoup4 \
        python-dotenv \
        requests \
    && conda run -n test1 python -m ipykernel install --user --name test1 --display-name 'Python (test1)' \
    && conda clean -afy \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete

# Create workspace directory with proper permissions
RUN mkdir -p /opt/notebooks && \
    mkdir -p /opt/notebooks/code && \
    chmod -R 777 /opt/notebooks

WORKDIR /opt/notebooks

# Set environment variable for notebook directory
ENV JUPYTER_NOTEBOOK_DIR=/opt/notebooks/code

# Default command with updated notebook directory reference
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=mypassword", "--IdentityProvider.token=mypassword"]
