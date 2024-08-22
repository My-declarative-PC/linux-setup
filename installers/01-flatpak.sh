#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='FlatPak'
print_installer_start $PACK

print_installer_step "Install the latest version ${PACK} packages"
sudo nala install -y flatpak

print_installer_step "Add FlatHub repos"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo echo 'export PATH=$PATH:/var/lib/flatpak/exports/bin' >> /etc/profile

print_installer_step "Install esentials flatpaks"
flatpak install --assumeyes flathub org.mozilla.firefox
sudo nala remove -y firefox

flatpak install --assumeyes flathub org.telegram.desktop

flatpak install --assumeyes flathub org.wezfurlong.wezterm

flatpak install --assumeyes flathub org.keepassxc.KeePassXC

flatpak install --assumeyes flathub net.cozic.joplin_desktop

print_installer_stop $PACK
