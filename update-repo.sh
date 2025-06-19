#!/bin/bash

# USAGE:
# 1. Change MONGO_MAJOR and MONGO_VERSION to the desired version.
# 2. To build locally and optionally push to a registry, run:
#      ./update-repo.sh [--push]
#
# Multi-platform tip:
# If you see “ERROR: Multi-platform build is not supported for the docker driver”,
# switch to a BuildKit builder that uses the containerd image store:
#
#   # Create and select a containerd-backed builder
#   docker buildx create --name multiarch --driver docker-container --use
#
#   # Bootstrap it (starts BuildKit and detects QEMU emulators)
#   docker buildx inspect --bootstrap
#
# (If you’re on a fresh Linux host, you may also need:
#   docker run --privileged --rm tonistiigi/binfmt --install all
# )
#
# ---------------------------------------------------------------------

MONGO_MAJOR=7.0
MONGO_VERSION=7.0.21

DOCKER_USERNAME=suitespottechnology

curl -O --remote-name-all https://raw.githubusercontent.com/docker-library/mongo/master/$MONGO_MAJOR/{Dockerfile,docker-entrypoint.sh}
chmod 755 ./docker-entrypoint.sh
docker buildx build --platform linux/arm64,linux/amd64 \
  --build-arg MONGO_PACKAGE=mongodb-enterprise \
  --build-arg MONGO_REPO=repo.mongodb.com \
  -t $DOCKER_USERNAME/mongo-enterprise:$MONGO_VERSION \
  -t $DOCKER_USERNAME/mongo-enterprise:latest \
  . $1
