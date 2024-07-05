#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
print_installer_start 'SWAY'
PACK='SWAY'
print_installer_start $PACK

print_installer_step "Install the latest version ${PACK} packages"
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

print_installer_step "Screen shot tools"
sudo nala install -y grim slurp

print_installer_step "Network File Tools/System Events"
sudo nala install -y dialog mtools dosfstools avahi-daemon acpi acpid

print_installer_step "enable Sys. events"
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

print_installer_stop $PACK
