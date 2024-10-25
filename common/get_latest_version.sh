#!/bin/bash

# Get package version from `GitHub` repo
get_latest_version() {
    local URL=$1
    local VERSION=$(curl -fL "${URL}" | yq '.[].ref' | sd '(.*\D)(\d+\.\d+\.\d+)(\D.*)' '$2' | sort -r -V | head -n 1)
    echo "${VERSION}"
}
