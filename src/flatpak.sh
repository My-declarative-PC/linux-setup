#!/bin/bash

source /var/lib/debian-setup/common/pretty_print.sh
pretty_print 'Install *FlatPak*'

echo "Install the latest version FlatPak packages"
nala install -y flatpak

echo "Add FlatHub repos"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo 'export PATH=$PATH:/var/lib/flatpak/exports/bin' >> /etc/profile

echo "Install esentials flatpaks"
flatpak install --assumeyes flathub org.mozilla.firefox
flatpak install --assumeyes flathub org.telegram.desktop
flatpak install --assumeyes flathub org.wezfurlong.wezterm
flatpak install --assumeyes flathub org.keepassxc.KeePassXC
