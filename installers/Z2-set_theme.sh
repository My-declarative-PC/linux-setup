#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK="CatPuccin Theme"
print_installer_start $PACK

mkdir -p /tmp/theme
cd /tmp/theme

export FLAVOR="mocha"
export ACCENT="mauve"
export THEME="catppuccin-${FLAVOR}-${ACCENT}-standard+default"
export THEME_DIR="${HOME}/.local/share/themes/${THEME}"

curl -LsSO "https://raw.githubusercontent.com/catppuccin/gtk/v1.0.3/install.py"
python3 install.py $FLAVOR $ACCENT

print_installer_step "Set the FlatPack theme"

ln -s "${HOME}/.local/share/themes" "${HOME}/.themes"
sudo cp -r "${THEME_DIR}" /usr/share/themes/

mkdir -p "${HOME}/.config/gtk-4.0" &&
ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets" &&
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css" &&
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

echo "export GTK_THEME=${THEME}" | sudo tee -a /etc/profile
print_installer_step "Give Flatpak apps access to GTK themes and icons location"
flatpak override --user --filesystem=$HOME/.local/share/themes:ro
flatpak override --user --filesystem=$HOME/.themes:ro
flatpak override --user --filesystem=$HOME/.icons:ro
flatpak override --user --env=GTK_THEME="${THEME}"

rm -rf /tmp/theme
print_installer_stop $PACK
