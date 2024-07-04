#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
print_installer_start 'Docker'

echo "Needed for docker installer"
nala install -y ca-certificates curl

echo "Delete old versions"
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo nala remove $pkg; done

echo "Add Docker's official GPG key"
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Add the repository to Apt sources"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo nala update

echo "Install the latest version Docker packages"
nala install -y           \
     docker-ce            \
     docker-ce-cli        \
     containerd.io        \
     docker-buildx-plugin \
     docker-compose-plugin
