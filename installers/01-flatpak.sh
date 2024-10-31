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
flatpak install --assumeyes flathub it.mijorus.gearlever

flatpak install --assumeyes flathub net.cozic.joplin_desktop

flatpak install --assumeyes flathub org.keepassxc.KeePassXC

flatpak install --assumeyes flathub org.mozilla.firefox

flatpak install --assumeyes flathub org.telegram.desktop

flatpak install --assumeyes flathub org.wezfurlong.wezterm

flatpak install --assumeyes flathub com.brave.browser

# print_installer_step "Tell Flatpak apps which theme/icon to use"
# sudo flatpak override --env=GTK_THEME=my-theme
# sudo flatpak override --env=ICON_THEME=my-icon-theme

print_installer_stop $PACK
