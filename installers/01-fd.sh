#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK='FD'
print_installer_start $PACK

TMP_PATH=/tmp/fd
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=https://api.github.com/repos/sharkdp/fd/releases/latest
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "arm64" ]; then
    ARCH="aarch64"
fi
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/sharkdp/fd/releases/download/v${VERSION}/fd-v${VERSION}-${ARCH}-unknown-linux-musl.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o fd.tar.gz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=fd.tar.gz
rm *gz
cd fd*

print_installer_step "Install ${PACK}"
sudo mv fd /usr/bin

rm -rf $TMP_PATH
print_installer_stop $PACK
