#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='Fish'
print_installer_start $PACK

sudo apt-add-repository ppa:fish-shell/release-3
sudo nala install -y fish

print_installer_stop $PACK
