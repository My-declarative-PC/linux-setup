#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK='LazyGit'
print_installer_start $PACK

TMP_PATH=/tmp/lazygit
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=https://api.github.com/repos/jesseduffield/lazygit/releases/latest
VERSION=$(get_latest_version $URL)
ARCH=$(dpkg --print-architecture)
if [ "$ARCH" = "amd64" ]; then
    ARCH="x86_64"
fi
URL=https://github.com/jesseduffield/lazygit/releases/download/v${VERSION}/lazygit_${VERSION}_Linux_${ARCH}.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o lazygit.tar.gz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=lazygit.tar.gz
rm *gz

print_installer_step "Install ${PACK}"
sudo mv lazygit /usr/bin

rm -rf $TMP_PATH
print_installer_stop $PACK
