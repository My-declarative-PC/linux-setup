#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK='FastFetch'
print_installer_start $PACK

TMP_PATH=/tmp/fastfetch
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=https://api.github.com/repos/fastfetch-cli/fastfetch/tags
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "x86_64" ]; then
    ARCH="amd64"
fi
URL=https://github.com/fastfetch-cli/fastfetch/releases/download/${VERSION}/fastfetch-linux-${ARCH}.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o fastfetch.tar.gz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=fastfetch.tar.gz
rm *gz
cd fastfetch*

print_installer_step "Install ${PACK}"
sudo cp -r usr/* /usr/

rm -rf $TMP_PATH
print_installer_stop $PACK
