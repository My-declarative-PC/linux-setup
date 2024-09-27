#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK='StarShip'
print_installer_start $PACK

TMP_PATH=/tmp/starship
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=https://api.github.com/repos/starship/starship/tags
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "arm64" ]; then
    ARCH="aarch64"
fi
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/starship/starship/releases/download/v${VERSION}/starship-${ARCH}-unknown-linux-musl.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o starship.tar.gz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=starship.tar.gz
rm *gz

print_installer_step "Install ${PACK}"
sudo mv starship /usr/bin

rm -rf $TMP_PATH
print_installer_stop $PACK
