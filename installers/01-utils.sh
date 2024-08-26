#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='Some smale Utils'
print_installer_start $PACK

sudo nala install -y \
     btop            \
     btrfs-compsize  \
     distrobox       \
     eza             \
     fish            \
     htop            \
     vim             \
     zoxide          \
     zram-tools

print_installer_stop $PACK
