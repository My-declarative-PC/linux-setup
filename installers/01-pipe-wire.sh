#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
PACK='Pipe Wire'
print_installer_start $PACK

print_installer_step "Install the latest version ${PACK} packages"
sudo nala install -y \
     pipewire   \
     pipewire-pulse

print_installer_step "enable ${PACK}"
sudo systemctl --now enable pipewire pipewire-pulse

print_installer_stop $PACK
