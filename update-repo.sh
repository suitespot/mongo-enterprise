#!/bin/bash

MONGO_MAJOR=6.0
MONGO_VERSION=6.0.3

DOCKER_USERNAME=suitespottechnology

curl -O --remote-name-all https://raw.githubusercontent.com/docker-library/mongo/master/$MONGO_MAJOR/{Dockerfile,docker-entrypoint.sh}
chmod 755 ./docker-entrypoint.sh
docker buildx build --platform linux/arm64,linux/amd64 \
  --build-arg MONGO_PACKAGE=mongodb-enterprise \
  --build-arg MONGO_REPO=repo.mongodb.com \
  -t $DOCKER_USERNAME/mongo-enterprise:$MONGODB_VERSION .
