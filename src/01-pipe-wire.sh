#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
print_installer_start 'Pipe Wire'

echo "Install the latest version Pipe Wire packages"
nala install -y \
     pipewire   \
     pipewire-pulse

echo "enable Pipe Wire"
systemctl --now enable pipewire pipewire-pulse
