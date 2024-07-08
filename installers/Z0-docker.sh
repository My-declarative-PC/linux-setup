#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
PACK='Docker'
print_installer_start $PACK

print_installer_step "Needed for ${PACK} installer"
sudo nala install -y ca-certificates curl

print_installer_step "Delete old versions"
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo nala remove $pkg; done

print_installer_step "Add Docker's official GPG key"
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

print_installer_step "Add the repository to Apt sources"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo nala update

print_installer_step "Install the latest version ${PACK} packages"
sudo nala install -y           \
     docker-ce            \
     docker-ce-cli        \
     containerd.io        \
     docker-buildx-plugin \
     docker-compose-plugin

print_installer_stop $PACK
