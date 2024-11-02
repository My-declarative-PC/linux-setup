#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='SDDM'
print_installer_start $PACK

print_installer_step "Remove unnecessary packages"
sudo nala remove lightdm

print_installer_step "Install the latest version ${PACK} packages"
sudo nala install -y sddm unzip
sudo nala install -y --no-install-recommends \
     libqt6svg6                              \
     qml-module-qtquick-controls2            \
     qml-module-qtquick-layouts              \
     qml-module-qtquick-window2

FLAVOR="mocha"
TMP_PATH=/tmp/$PACK
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH

URL=https://github.com/catppuccin/sddm/releases/latest/download/catppuccin-${FLAVOR}.zip
echo "<<< ${URL} >>>"
curl -fL $URL -o catppuccin.zip

print_installer_step "SetUp theme for ${PACK}"

unzip catppuccin.zip
rm *zip
sudo mv cat* /usr/share/sddm/themes/

echo "[Theme]"                        | sudo tee -a /etc/sddm.conf
echo "Current=catppuccin-${FLAVOR}"   | sudo tee -a /etc/sddm.conf
echo "Font=CaskaydiaCoveNerdFontMono" | sudo tee -a /etc/sddm.conf

print_installer_stop $PACK
