#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK="Dotfile's"
print_installer_start $PACK

print_installer_step "Needed for ${PACK} installer"
sudo nala install -y stow

cd ~
gti clone https://github.com/My-declarative-PC/dotfiles.git
cd ~/dotfiles

declare -a modules=(
  "fastfetch"
  "fish"
  "helix"
  "starship"
  "zellij"
)

for module in "${modules[@]}"
do
  echo "$module"
  git submodule init -- "$module"
  git submodule update --init -- "$module"
  stow --dotfiles -t ~ "$module"
done
