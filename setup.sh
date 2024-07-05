#!/bin/bash

echo "Run installers"
for script in /var/lib/debian-setup/installers/*.sh; do source $script; done
