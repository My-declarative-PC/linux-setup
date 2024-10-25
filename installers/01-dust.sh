#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK='dust'
print_installer_start $PACK

TMP_PATH=/tmp/dust
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=https://api.github.com/repos/bootandy/dust/git/refs/tags
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "arm64" ]; then
    ARCH="aarch64"
fi
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/bootandy/dust/releases/download/v${VERSION}/dust-v${VERSION}-${ARCH}-unknown-linux-musl.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o dust.tar.gz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=dust.tar.gz
rm *gz
cd dust*

print_installer_step "Install ${PACK}"
sudo cp dust /usr/bin

rm -rf $TMP_PATH
print_installer_stop $PACK
