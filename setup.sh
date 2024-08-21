#!/bin/bash

echo "Run installers"
for script in /var/lib/linux-setup/installers/*.sh; do source $script; done
