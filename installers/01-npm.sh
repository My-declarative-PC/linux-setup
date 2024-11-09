#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='npm'
print_installer_start $PACK

sudo nala install -y nodejs npm

print_installer_step "Install bash LSP"
sudo npm install -g bash-language-server
print_installer_step "Install Docker LSP"
sudo npm install -g dockerfile-language-server-nodejs
print_installer_step "Install docker-compose LSP"
sudo npm install -g @microsoft/compose-language-service

print_installer_stop $PACK
