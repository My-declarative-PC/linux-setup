#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK='Helix'
print_installer_start $PACK

TMP_PATH=/tmp/helix
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=https://api.github.com/repos/helix-editor/helix/tags
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/helix-editor/helix/releases/download/${VERSION}/helix-${VERSION}-${ARCH}-linux.tar.xz
echo "<<< ${URL} >>>"
curl -fL $URL -o helix.tar.xz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=helix.tar.xz
rm *xz
cd helix*
cd helix*

print_installer_step "Install ${PACK}"
sudo mv hx /usr/bin

sudo mkdir -p /var/lib/helix
sudo mv runtime /var/lib/helix/

rm -rf $TMP_PATH
print_installer_stop $PACK
