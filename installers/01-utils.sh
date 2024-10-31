#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='Some smale Utils'
print_installer_start $PACK

sudo nala install -y   \
     btop              \
     btrfs-compsize    \
     cifs-utils        \
     distrobox         \
     eza               \
     htop              \
     imagemagick-6.q16 \
     rofi              \
     scrot             \
     vim               \
     xclip             \
     xsel              \
     zoxide            \
     zram-tools

print_installer_stop $PACK
