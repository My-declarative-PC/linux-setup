#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
PACK='GitHub CLI tools'
print_installer_start $PACK

print_installer_step "Needed for ${PACK} installer"
sudo nala install -y ca-certificates curl

print_installer_step "Add '{$PACK}' official GPG key"
sudo mkdir -p -m 755 /etc/apt/keyrings \
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
    sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

print_installer_step "Add the repository to Apt sources"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] \
  https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo nala update

print_installer_step "Install the latest version ${PACK} packages"
sudo nala install -y gh

print_installer_stop $PACK
