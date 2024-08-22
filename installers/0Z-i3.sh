#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='i3'
print_installer_start $PACK

print_installer_step "Needed for ${PACK} installer"
sudo nala install -y ca-certificates curl

print_installer_step "Add ${PACK}'s official GPG key"
/usr/lib/apt/apt-helper download-file \
    https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb \
    keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734

print_installer_step "Add the repository to Apt sources"
echo "deb http://debian.sur5r.net/i3/ $(grep '^UBUNTU_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo nala update

print_installer_step "Install the latest version ${PACK} packages"
sudo nala install -y \
     i3              \
     feh             \
     picom

print_installer_stop $PACK
