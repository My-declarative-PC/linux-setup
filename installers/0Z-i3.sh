#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='i3'
print_installer_start $PACK

print_installer_step "Install the latest version ${PACK} packages"
sudo nala install -y \
     i3              \
     feh             \
     picom

print_installer_stop $PACK
