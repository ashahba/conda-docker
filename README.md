# conda-docker
A very simplistic Conda docker environment

## To build it
```bash
export PYTHON_VER=3.7
export UBUNTU_VERSION=20.04
docker build --build-arg UBUNTU_VERSION=${UBUNTU_VERSION} --build-arg PYTHON_VER=${PYTHON_VER} . -f Dockerfile -t anaconda3:ubuntu-${UBUNTU_VERSION}-py${PYTHON_VER}
```

## To run it
```
docker run -it anaconda3:ubuntu-${UBUNTU_VERSION}-py${PYTHON_VER} bash

root@b86de89d392f:/# conda env list
# conda environments:
#
base                  *  /opt/anaconda3
                         /opt/anaconda3/py3.7

root@b86de89d392f:/# conda activate /opt/anaconda3/py3.7/
(/opt/anaconda3/py3.7) root@b86de89d392f:/# exit

exit
```
