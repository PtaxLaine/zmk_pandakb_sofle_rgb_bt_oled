#!/usr/bin/bash
set -euo pipefail

PODMAN='/usr/bin/podman'
IMG_NAME='zmk-sofle-pkb-build-raw'
IMG_NAME_W='zmk-sofle-pkb-build-work'

cd "$(dirname -- "${BASH_SOURCE[0]}")"
mkdir -p bin

cd zmk.git
$PODMAN build -t $IMG_NAME -f Dockerfile .devcontainer
cd ..
$PODMAN build -t $IMG_NAME_W .
$PODMAN run --rm \
        -v $PWD:/workspaces/zmk-config \
        -v $PWD/bin:/workspaces/bin \
        $IMG_NAME_W

