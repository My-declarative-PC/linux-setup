#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='zellij'
print_installer_start $PACK

TMP_PATH=/tmp/zellij
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/zellij-org/zellij/releases/latest/download/zellij-${ARCH}-unknown-linux-musl.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o zellij.tar.gz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=zellij.tar.gz
rm *gz

print_installer_step "Install ${PACK}"
sudo cp -r zellij /usr/bin
cd /tmp

rm -rf $TMP_PATH
print_installer_stop $PACK
