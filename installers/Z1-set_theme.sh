#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK="CatPuccin Theme"
print_installert_start $PACK

curl -LsSO "https://raw.githubusercontent.com/catppuccin/gtk/v1.0.3/install.py"
python3 install.py mocha mauve

print_installer_step "Set the FlatPack theme"
export FLAVOR="mocha"
export ACCENT="mauve"

sudo flatpak override --env=GTK_THEME="catppuccin-${FLAVOR}-${ACCENT}-standard+default"

print_installer_stop $PACK
