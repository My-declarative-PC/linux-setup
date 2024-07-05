#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
PACK='Network Manager'
print_installer_start $PACK

print_installer_step "Install the latest version ${PACK} packages"
nala install -y              \
     network-manager-ssh     \
     network-manager-openvpn \
     network-manager

print_installer_step "enable ${PACK}"
systemctl enable --now NetworkManager

print_installer_stop $PACK
