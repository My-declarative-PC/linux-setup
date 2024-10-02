#!/bin/bash

# Get package version from `GitHub` repo
get_latest_version() {
    local URL=$1
    local VERSION=$(curl -fL "$URL" | sd '("name": ")(v[^\d]*)([\d\.]+)(.*)(",.*)' '$1$3$5' | sd '\."' '"' | jq 'max_by(.name|split(".")|map(tonumber)).name' | xargs)
    echo "$VERSION"
}
