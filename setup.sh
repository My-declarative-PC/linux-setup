#!/bin/bash

echo "Run installers"
for script in /var/lib/debian-setup/src/*.sh; do source $script; done
