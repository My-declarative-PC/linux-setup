#!/bin/bash

source /var/lib/debian-setup/common/pretty_print.sh
pretty_print 'Install *Network Manager*'

echo "Install the latest version Network Manager packages"
nala install -y              \
     network-manager-ssh     \
     network-manager-openvpn \
     network-manager

echo "enable Network Manager"
systemctl enable --now NetworkManager
