#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
print_installer_start 'SWAY'

nala install -y \
     light      \
     sway       \
     swaybg     \
     swayidle   \
     swayimg    \
     swaylock   \
     waybar     \
     wofi       \
     fonts-font-awesome
