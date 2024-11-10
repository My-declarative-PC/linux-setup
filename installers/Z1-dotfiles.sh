#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK="Dotfile's"
print_installer_start $PACK

sudo git clone https://github.com/My-declarative-PC/dotfiles.git /etc/dotfiles
cd /etc/dotfiles

declare -a modules=(
  "bashrc"
  "btop"
  "fastfetch"
  "fish"
  "git"
  "helix"
  "starship"
  "zellij"
)

for module in "${modules[@]}"
do
  echo "$module"
  sudo git submodule init          --   "$module"
  sudo git submodule update --init --   "$module"
       stow --adopt --dotfiles -t ~     "$module"
  sudo stow --adopt --dotfiles -t /root "$module"
done

sudo git checkout -- .
sudo git clean -fd
sudo git submodule foreach 'git checkout -- . && git clean -fd'

module="profile"
echo "$module"
sudo git submodule init          -- "$module"
sudo git submodule update --init -- "$module"
sudo ln -s /etc/dotfiles/$module/custom_init.sh    /etc/profile.d/custom_init.sh
sudo ln -s /etc/dotfiles/$module/custom_profile.sh /etc/profile.d/custom_profile.sh
