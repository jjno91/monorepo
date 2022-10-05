#!/bin/bash

# preflight checks
aws sts get-caller-identity > /dev/null || echo "ERROR authenticating with AWS" && exit 1
git --version || echo "ERROR missing dependency: git" && exit 2
terraform --version || echo "ERROR missing dependency: terraform" && exit 3
aws --version || echo "ERROR missing dependency: aws" && exit 4

export DIRECTORY=${DIRECTORY:-terraform}
export BACKEND_PREFIX=${BACKEND_PREFIX:-terraform-backend}

if [ -z "${BRANCH}" ]; then
    BRANCH=$(git branch --show-current)
    export BRANCH
fi

if [ -z "${BUCKET}" ]; then
    BUCKET=$(aws s3 ls | cut -d " " -f 3 | grep -e "^${BACKEND_PREFIX}")
    export BUCKET
fi

if [ -z "${BUCKET}" ]; then
    echo "cannot find bucket"
fi

if [ -d "${DIRECTORY}" ]; then
    cd "${DIRECTORY}" || echo "ERROR changing directory to: ${DIRECTORY}" && exit 2
fi
