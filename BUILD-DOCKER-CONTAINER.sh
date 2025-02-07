#!/bin/bash

################################################################################

# Set the Docker container name from a project name (first argument).
# If no argument is given, use the current user name as the project name.
if [ -z "$DEEP_PROJECT_NAME" ]; then
  echo "Set DEEP_PROJECT_NAME (e.g. 'export DEEP_PROJECT_NAME=mytest')"
  exit 1
fi
PROJECT=$DEEP_PROJECT_NAME
CONTAINER="${PROJECT}_deep_1"
export HOSTNAME=$(hostname)
export CONTAINER=$CONTAINER  # Export the container name for docker compose to coherently set container name.

# タグが指定されていない場合は "latest" をデフォルトとする
if [ -z "$DEEP_IMAGE_TAG" ]; then
  export DEEP_IMAGE_TAG=latest
fi

echo "$0: PROJECT=${PROJECT}"
echo "$0: CONTAINER=${CONTAINER}"
echo "$0: Using image tag: ${DEEP_IMAGE_TAG}"

# Stop and remove the Docker container.
EXISTING_CONTAINER_ID=$(docker ps -aq -f name=${CONTAINER})
if [ ! -z "${EXISTING_CONTAINER_ID}" ]; then
  echo "The container name ${CONTAINER} is already in use" 1>&2
  echo ${EXISTING_CONTAINER_ID}
  exit 1
fi

################################################################################

# Build the Docker image with the Nvidia GL library.
echo "starting build"
docker-compose -p ${PROJECT} -f ./docker/docker-compose.yml build
