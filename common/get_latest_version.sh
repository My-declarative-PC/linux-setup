#!/bin/bash

# Get package version from `GitHub` repo
get_latest_version() {
    local URL=$1
    local VERSION=$(curl -fL "${URL}" | yq '.tag_name' | sd '(")([^"]+)(")' '$2' | sd 'v*' '')
    echo "${VERSION}"
}
