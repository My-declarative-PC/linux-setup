#!/bin/bash

echo "Needed for all installers"
sudo apt update
sudo apt upgrade -y
sudo apt install -y nala

sudo nala install -y git sudo apt-utils sd jq curl

echo "Run installers"
for script in /var/lib/linux-setup/installers/*.sh; do source $script; done
