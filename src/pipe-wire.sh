#!/bin/bash

source /var/lib/debian-setup/common/pretty_print.sh
pretty_print 'Install *Pipe Wire*'

echo "Install the latest version Pipe Wire packages"
nala install -y \
     pipewire   \
     pipewire-pulse

echo "enable Pipe Wire"
systemctl --now enable pipewire pipewire-pulse
