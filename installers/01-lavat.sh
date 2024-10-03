#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='lavat'
print_installer_start $PACK

TMP_PATH=/tmp/lavat
mkdir -p $TMP_PATH

print_installer_step "Needed for ${PACK} installer"
sudo nala install -y make gcc

print_installer_step "Download ${PACK} repo"
cd $TMP_PATH
git clone https://github.com/AngelJumbo/lavat
cd lavat

print_installer_step "Install ${PACK}"
sudo make install

sudo rm -rf $TMP_PATH
print_installer_stop $PACK
