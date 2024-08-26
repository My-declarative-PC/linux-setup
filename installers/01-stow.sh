#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK="stow"
print_installer_start $PACK

TMP_PATH=/tmp/stow
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=http://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o stow.tar.gz

print_installer_step "Unpack ${PACK} archive"
tar --same-permissions --extract --file=stow.tar.gz
rm *gz
cd stow*

print_installer_step "Install ${PACK}"
sudo ./configure && sudo make install

print_installer_stop $PACK
