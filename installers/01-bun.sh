#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='bun'
print_installer_start $PACK

print_installer_step "Download ${PACK}"
curl -fsSL https://bun.sh/install | bash
BUN=/home/$USER/.bun/bin/bun

print_installer_step "Install bash LSP"
$BUN install -g bash-language-server
print_installer_step "Install Docker LSP"
$BUN install -g dockerfile-language-server-nodejs
print_installer_step "Install docker-compose LSP"
$BUN install -g @microsoft/compose-language-service

print_installer_stop $PACK
