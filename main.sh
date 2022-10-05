#!/bin/bash -ex

export DIRECTORY=${DIRECTORY:-terraform}
export BACKEND_PREFIX=${BACKEND_PREFIX:-terraform-backend}

if [ -z "${BRANCH}" ]; then
    BRANCH=$(git branch --show-current)
    export BRANCH
fi

if [ -z "${BUCKET}" ]; then
    BUCKET=$(aws s3 ls | cut -d " " -f 3 | grep -e "^${BACKEND_PREFIX}")
fi

if [ -d "${DIRECTORY}" ]; then
    cd "${DIRECTORY}"
fi
