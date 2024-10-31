#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK='i3'
print_installer_start $PACK

print_installer_step "Install the latest version ${PACK} packages"
sudo nala install -y \
     feh             \
     i3              \
     i3blocks        \
     light-locker    \
     picom           \
     xinit           \
     xorg            \
     xrdp

echo "#!/bin/sh"        | tee -a ~/.xinitrc
echo "exec /usr/bin/i3" | tee -a ~/.xinitrc
     cp ~/.xinitrc ~/.xsessions
sudo cp ~/.xinitrc /etc/X11/xinit/xinitrc

print_installer_stop $PACK
