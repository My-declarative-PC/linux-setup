#!/bin/bash

echo "Needed for all update"
sudo nala update
sudo nala upgrade -y

echo "Run updaters"
for script in /var/lib/linux-setup/updaters/*.sh; do source $script; done
