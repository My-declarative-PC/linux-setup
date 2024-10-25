#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK='RipGrep'
print_installer_start $PACK

TMP_PATH=/tmp/ripgrep
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=https://api.github.com/repos/BurntSushi/ripgrep/git/refs/tags
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "arm64" ]; then
    ARCH="aarch64"
fi
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
LIB_TYPE="gnu"
if [ "$ARCH" = "x86_64" ]; then
    LIB_TYPE="musl"
fi
URL=https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/ripgrep-${VERSION}-${ARCH}-unknown-linux-${LIB_TYPE}.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o ripgrep.tar.gz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=ripgrep.tar.gz
rm *gz
cd ripgrep*

print_installer_step "Install ${PACK}"
sudo cp -r rg /usr/bin/

rm -rf $TMP_PATH
print_installer_stop $PACK
