#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
PACK='Thunar'
print_installer_start $PACK

print_installer_step "Install the latest version ${PACK} packages"
sudo nala install -y       \
     thunar                \
     thunar-archive-plugin \
     thunar-volman         \
     file-roller           \
     gvfs-backends

print_installer_stop $PACK
