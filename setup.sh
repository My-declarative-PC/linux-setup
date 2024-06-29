#!/bin/bash

echo "Run installers"
for script in /tmp/debian-setup/src/*.sh; do source $script; done
