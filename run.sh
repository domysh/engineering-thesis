#!/usr/bin/env bash

cd "$(dirname "$0")"

docker build -t tex-builder ./utils || exit 1
docker run --volume ./:/workspace/ tex-builder ./utils/build.sh || exit 1 
if [ "$1" == "open" ]; then
    open ./build/main.pdf
fi

