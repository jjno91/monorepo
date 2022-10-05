#!/bin/bash -ex

export DEFAULT_BRANCH=${DEFAULT_BRANCH:-main}
export DIRECTORY=${DIRECTORY:-terraform}

if [ -z "${BRANCH}" ]; then
    BRANCH=$(git branch --show-current)
    export BRANCH
fi

if [ -d "${DIRECTORY}" ]; then
    cd "${DIRECTORY}"
fi
