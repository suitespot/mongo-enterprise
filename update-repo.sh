#!/bin/bash

# USAGE: 
# Change MONGO_MAJOR and MONGO_VERSION to desired a version.
# To build locally and push to repository, run:
#   ./update-repo.sh --push

MONGO_MAJOR=6.0
MONGO_VERSION=6.0.6

DOCKER_USERNAME=suitespottechnology

curl -O --remote-name-all https://raw.githubusercontent.com/docker-library/mongo/master/$MONGO_MAJOR/{Dockerfile,docker-entrypoint.sh}
chmod 755 ./docker-entrypoint.sh
docker buildx build --platform linux/arm64,linux/amd64 \
  --build-arg MONGO_PACKAGE=mongodb-enterprise \
  --build-arg MONGO_REPO=repo.mongodb.com \
  -t $DOCKER_USERNAME/mongo-enterprise:$MONGO_VERSION \
  -t $DOCKER_USERNAME/mongo-enterprise:latest \
  . $1
