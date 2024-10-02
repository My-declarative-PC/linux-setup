#!/bin/bash

source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/print_installer_start.sh
PACK='thinkpad-scripts'
print_installer_start $PACK

TMP_PATH=/tmp/thinkpad_scripts
mkdir -p $TMP_PATH

print_installer_step "Needed for ${PACK} installer"
sudo nala install -y         \
          acpid              \
          alsa-utils         \
          gettext            \
          libglib2.0-bin     \
          make               \
          network-manager    \
          pulseaudio-utils   \
          python3            \
          python3-setuptools \
          python3-sphinx     \
          udev               \
          usbutils           \
          x11-xserver-utils  \
          xbacklight         \
          xinput             \
          xserver-xorg-input-wacom

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
git clone https://github.com/martin-ueding/thinkpad-scripts.git
cd thinkpad-scripts

print_installer_step "Install ${PACK}"
sudo make
sudo make full-install
sudo ./setup.py install

sudo rm -rf $TMP_PATH
print_installer_stop $PACK
