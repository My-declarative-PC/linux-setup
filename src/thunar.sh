#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
print_installer_start 'Thunar'

nala install -y            \
     thunar                \
     thunar-archive-plugin \
     thunar-volman         \
     file-roller           \
     gvfs-backends
