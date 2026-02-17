#!/bin/bash
# save as k3s-image-build.sh

if [ $# -lt 2 ]; then
    echo "Usage: $0 <image-name:tag> <build-context>"
    exit 1
fi

IMAGE_NAME=$1
BUILD_CONTEXT=$2

echo "Building image $IMAGE_NAME..."
docker build -t "$IMAGE_NAME" "$BUILD_CONTEXT"

echo "Importing image to k3s..."
docker save "$IMAGE_NAME" | sudo k3s ctr images import -

echo "Image $IMAGE_NAME is now available in k3s"

