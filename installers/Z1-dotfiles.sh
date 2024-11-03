#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK="Dotfile's"
print_installer_start $PACK

sudo git clone https://github.com/My-declarative-PC/dotfiles.git /etc/dotfiles
cd /etc/dotfiles

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
  sudo git submodule init -- "$module"
  sudo git submodule update --init -- "$module"
  stow --dotfiles -t ~ "$module"
done

sudo ln -s /etc/dotfiles/bashrc/custom_init.sh    /etc/profile.d/custom_init.sh
sudo ln -s /etc/dotfiles/bashrc/custom_profile.sh /etc/profile.d/custom_profile.sh
