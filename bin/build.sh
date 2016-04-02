#!/bin/sh

DOCKER="docker"
BUILDFLAGS="--rm"
IMAGE_TAG=$1
DOCKERFILE_PATH=$2
TAG_LATEST=$3

${DOCKER} build ${BUILDFLAGS} -t gmaissa/php:${IMAGE_TAG} ${DOCKERFILE_PATH}
if [ ! -z ${PUSH} ]; then
    ${DOCKER} push gmaissa/php:${IMAGE_TAG}
    if [ "${TAG_LATEST}" = "${IMAGE_TAG}" ]; then
        ${DOCKER} tag gmaissa/php:${IMAGE_TAG} gmaissa/php:latest
        ${DOCKER} push gmaissa/php:latest
    fi
fi
