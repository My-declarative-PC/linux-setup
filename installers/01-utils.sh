#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
PACK='Some smale Utils'
print_installer_start $PACK

nala install -y      \
     btrfs-compsize  \
     zram-tools      \
     thunar          \
     distrobox

print_installer_stop $PACK
