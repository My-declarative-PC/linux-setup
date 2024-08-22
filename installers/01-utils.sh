#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='Some smale Utils'
print_installer_start $PACK

sudo nala install -y \
     btrfs-compsize  \
     zram-tools      \
     distrobox

print_installer_stop $PACK
