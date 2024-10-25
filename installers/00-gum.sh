#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh

TMP_PATH=/tmp/gum
mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/charmbracelet/gum/git/refs/tags
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/charmbracelet/gum/releases/download/v${VERSION}/gum_${VERSION}_Linux_${ARCH}.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o gum.tar.gz

tar --same-permissions --extract --file=gum.tar.gz
rm *gz
cd gum*

sudo mv gum /usr/bin

rm -rf $TMP_PATH

gum style                   \
    --foreground 212        \
    --border-foreground 212 \
    --border double         \
    --align center          \
    --width 50              \
    --margin "1 2"          \
    --padding "2 4"         \
    'Congratulations!!!' '`Gum` installed successfully'
