# syntax=docker/dockerfile:1
ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG PYTHON_VERSION=3.12

FROM --platform=$BUILDPLATFORM multiarch/qemu-user-static:latest AS qemu

FROM --platform=$TARGETPLATFORM arm32v7/python:${PYTHON_VERSION}-slim-bookworm AS build

ARG MAX_JOBS=48

# Enable ARM execution on non-ARM hosts.
COPY --from=qemu /usr/bin/qemu-arm-static /usr/bin/

RUN apt-get update && apt-get install -y --no-install-recommends     build-essential     cmake     git     libopenblas-dev     libblas-dev     m4     ninja-build     pkg-config     python3-dev     python3-yaml     python3-setuptools     && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/pytorch
COPY pytorch/ /opt/pytorch/

ENV NO_CUDA=1     NO_DISTRIBUTED=1     NO_MKLDNN=1     NO_NNPACK=1     NO_QNNPACK=0     BUILD_TEST=0     USE_FBGEMM=0     USE_OPENCV=0     USE_OPENMP=0     USE_QNNPACK=1     USE_PYTORCH_QNNPACK=1     USE_NNPACK=0     USE_NINJA=1     CMAKE_GENERATOR=Ninja     MAX_JOBS=${MAX_JOBS}     CMAKE_BUILD_PARALLEL_LEVEL=${MAX_JOBS}     MAKEFLAGS="-j${MAX_JOBS}"     CFLAGS="-march=armv7-a -mfpu=neon-vfpv4 -mfloat-abi=hard"     CXXFLAGS="-march=armv7-a -mfpu=neon-vfpv4 -mfloat-abi=hard"

RUN pip install --no-cache-dir -r requirements.txt     && pip install --no-cache-dir typing-extensions sympy networkx jinja2

RUN python3 setup.py bdist_wheel

FROM scratch AS wheel-export
COPY --from=build /opt/pytorch/dist /dist
