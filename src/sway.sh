#!/bin/bash

source /var/lib/debian-setup/common/pretty_print.sh
pretty_print 'Install *SWAY*'

nala install -y \
     light      \
     sway       \
     swaybg     \
     swayidle   \
     swayimg    \
     swaylock   \
     waybar     \
     wofi       \
     fonts-font-awesome
