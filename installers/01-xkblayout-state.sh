#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='xkblayout state'
print_installer_start $PACK

TMP_PATH=/tmp/xkblayout
mkdir -p $TMP_PATH
cd $TMP_PATH

print_installer_step "Install build dependencies for ${PACK}"
sudo nala install -y libx11-dev make

print_installer_step "Clone ${PACK} repo"
git clone https://github.com/nonpop/xkblayout-state.git
cd xkblayout-state

print_installer_step "Build ${PACK}"
make
sudo chmod a+x ./xkblayout-state

print_installer_step "Install ${PACK}"
sudo cp xkblayout-state /usr/bin/xkblayout-state

print_installer_stop $PACK
