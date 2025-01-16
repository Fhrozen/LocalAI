#!/bin/bash

use_tgt="--target requirements-drivers"
tag="drivers"

use_tgt="--target grpc"
tag="grpc"

use_tgt=""  # "--target final-build"
tag="cublas-cuda12-ffmpeg-core"


docker build ${use_tgt} -t localai:${tag} \
    --build-arg BUILD_TYPE=cublas \
    --build-arg CUDA_MAJOR_VERSION=12 \
    --build-arg CUDA_MINOR_VERSION=0 \
    --build-arg FFMPEG=true \
    --build-arg IMAGE_TYPE=core \
    --build-arg BASE_IMAGE=ubuntu:22.04 \
    --build-arg GRPC_BASE_IMAGE=ubuntu:22.04 \
    --build-arg GRPC_MAKEFLAGS="--jobs=4 --output-sync=target" \
    --build-arg GRPC_VERSION=v1.65.0 \
    --build-arg MAKEFLAGS="--jobs=4 --output-sync=target" \
    --build-arg SKIP_DRIVERS=false \
    -f ./Dockerfile .
