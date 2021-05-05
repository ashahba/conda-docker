ARG UBUNTU_VERSION=20.04
FROM ubuntu:${UBUNTU_VERSION}

ARG ANACONDA3_VER=2020.11-Linux-x86_64
ARG CONDA_ROOT=/opt/anaconda3

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends --fix-missing \
    ca-certificates \
    curl

RUN curl https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh > Anaconda3-${ANACONDA3_VER}.sh && \
    chmod +x Anaconda3-${ANACONDA3_VER}.sh && \
    bash Anaconda3-${ANACONDA3_VER}.sh -b -p ${CONDA_ROOT} && \
    rm ./Anaconda3-${ANACONDA3_VER}.sh

ENV PATH ${CONDA_ROOT}/bin:$PATH

# Source conda.sh for all login and interactive shells.
RUN ln -s ${CONDA_ROOT}/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /etc/profile.d/conda.sh" >> ~/.bashrc && \
    # Set always_yes for non-interactive shells.
    conda config --system --set always_yes True && \
    conda clean --all

ARG PYTHON_VER=3.8
RUN conda create -y --prefix ${CONDA_ROOT}/py${PYTHON_VER} python=${PYTHON_VER}
