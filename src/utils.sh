#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
print_installer_start 'Some smale Utils'

nala install -y      \
     btrfs-compsize  \
     zram-tools      \
     thunar          \
     distrobox
