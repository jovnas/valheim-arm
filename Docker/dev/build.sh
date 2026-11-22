#!/bin/bash

ARCH=$(uname -m)
cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit 1

if [[ "$ARCH" == "aarch64" ]]; then
    echo "Building for ARM64..."
    IMAGE_TAG=arm64
elif [[ "$ARCH" == "x86_64" ]]; then
    echo "Building for AMD64..."
    IMAGE_TAG=amd64
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

docker build \
    --build-arg "BASE_IMAGE=${BASE_IMAGE:-tsxcloud/steamcmd-wine-ntsync:latest}" \
    -t "tsxcloud/valheim-arm:${IMAGE_TAG}" "$@" ../
