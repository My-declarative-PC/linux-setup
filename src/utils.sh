#!/bin/bash

source /var/lib/debian-setup/common/pretty_print.sh
pretty_print 'Install *Some smale Utils*'

nala install -y      \
     btrfs-compsize  \
     zram-tools      \
     thunar          \
     distrobox
