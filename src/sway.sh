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

# grim (screenshots in Wayland) and slurp (select a region in wayland) - kinda like scrot
sudo nala install -y grim slurp

# Network File Tools/System Events
sudo nala install -y dialog mtools dosfstools avahi-daemon acpi acpid

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid
