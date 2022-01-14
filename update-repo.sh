#!/bin/bash

MONGODB_VERSION=5.0
DOCKER_USERNAME=suitespot

curl -O --remote-name-all https://raw.githubusercontent.com/docker-library/mongo/master/$MONGODB_VERSION/{Dockerfile,docker-entrypoint.sh}
chmod 755 ./docker-entrypoint.sh
docker build \
  --build-arg MONGO_PACKAGE=mongodb-enterprise \
  --build-arg MONGO_REPO=repo.mongodb.com \
  -t $DOCKER_USERNAME/mongo-enterprise:$MONGODB_VERSION .
