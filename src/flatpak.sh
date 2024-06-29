#!/bin/bash

source /tmp/debian-setup/common/pretty_print.sh
pretty_print 'Install *FlatPak*'

nala install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo 'export PATH=$PATH:/var/lib/flatpak/exports/bin' >> /etc/profile

flatpak install --assumeyes flathub org.mozilla.firefox
flatpak install --assumeyes flathub org.wezfurlong.wezterm
