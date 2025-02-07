#!/usr/bin/env bash

cd "$(dirname "$0")"

docker run -it --volume ./:/workspace/ $(docker build -q ./utils) ./utils/build.sh
if [ "$1" == "open" ]; then
    open ./build/main.pdf
fi
