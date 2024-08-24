#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh

TMP_PATH=/tmp/lazygit
mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/jesseduffield/lazygit/tags
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/jesseduffield/lazygit/releases/download/v${VERSION}/lazygit_${VERSION}_Linux_${ARCH}.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o lazygit.tar.gz

tar --same-permissions --extract --file=lazygit.tar.gz
rm *gz

sudo mv lazygit /usr/bin

rm -rf $TMP_PATH
