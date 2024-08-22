#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK="Dotfile's"
print_installer_start $PACK

cd ~
git clone https://github.com/My-declarative-PC/dotfiles.git
cd ~/dotfiles

declare -a modules=(
  "fastfetch"
  "fish"
  "helix"
  "i3"
  "starship"
  "wezterm"
  "zellij"
)

for module in "${modules[@]}"
do
  echo "$module"
  git submodule init -- "$module"
  git submodule update --init -- "$module"
  stow --dotfiles -t ~ "$module"
done
