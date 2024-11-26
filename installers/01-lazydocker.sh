#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK='LazyDocker'
print_installer_start $PACK

TMP_PATH=/tmp/lazydocker
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=https://api.github.com/repos/jesseduffield/lazydocker/releases/latest
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/jesseduffield/lazydocker/releases/download/v${VERSION}/lazydocker_${VERSION}_Linux_${ARCH}.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o lazydocker.tar.gz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=lazydocker.tar.gz
rm *gz

print_installer_step "Install ${PACK}"
sudo mv lazydocker /usr/bin

rm -rf $TMP_PATH
print_installer_stop $PACK
