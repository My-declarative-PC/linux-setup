#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='yazi'
print_installer_start $PACK

TMP_PATH=/tmp/yazi
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "arm64" ]; then
    ARCH="aarch64"
fi
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/sxyazi/yazi/releases/latest/download/yazi-${ARCH}-unknown-linux-musl.zip
echo "<<< ${URL} >>>"
curl -fL $URL -o yazi.zip

print_installer_step "Unpack ${PACK} archive"
unzip yazi.zip
rm *zip

print_installer_step "Install ${PACK}"
cd ya*
sudo cp -r ya* /usr/bin
cd /tmp

rm -rf $TMP_PATH
print_installer_stop $PACK
