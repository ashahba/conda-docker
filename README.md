# conda-docker
A very simplistic Conda docker environment

## To build Miniconda3 container
```bash
UBUNTU_VERSION=22.04
PYTHON_VER=3.10
CONDA=miniconda
docker build \
  --build-arg UBUNTU_VERSION=${UBUNTU_VERSION} \
  --build-arg PYTHON_VER=${PYTHON_VER} \
  -f Dockerfile.${CONDA} \
  -t ${CONDA}:ubuntu-${UBUNTU_VERSION}-py${PYTHON_VER} \
  .
```

## To run Miniconda3 it
```
docker run --rm -it ${CONDA}:ubuntu-${UBUNTU_VERSION}-py${PYTHON_VER} bash

root@cc30dadfbbf6:/# conda env list
# conda environments:
#
base                  *  /opt/miniconda3
py3.10                   /opt/miniconda3/py3.10

root@cc30dadfbbf6:/# conda activate py3.10
(py3.10) root@cc30dadfbbf6:/# python --version
Python 3.10.11

exit
```

## To build Anaconda3 container
```bash
UBUNTU_VERSION=22.04
PYTHON_VER=3.10
CONDA=anaconda
docker build \
  --build-arg UBUNTU_VERSION=${UBUNTU_VERSION} \
  --build-arg PYTHON_VER=${PYTHON_VER} \
  -f Dockerfile.${CONDA} \
  -t ${CONDA}:ubuntu-${UBUNTU_VERSION}-py${PYTHON_VER} \
  .
```

## To run Anaconda3 it
```
docker run --rm -it ${CONDA}:ubuntu-${UBUNTU_VERSION}-py${PYTHON_VER} bash

root@cc30dadfbbf6:/# conda env list
# conda environments:
#
base                  *  /opt/anaconda3
py3.10                   /opt/anaconda3/py3.10

root@cc30dadfbbf6:/# conda activate py3.10
(py3.10) root@cc30dadfbbf6:/# python --version
Python 3.10.11

exit
```
