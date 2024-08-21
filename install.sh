#!/bin/bash

echo "Needed for all installers"
sudo apt update
sudo apt upgrade -y
sudo apt install -y nala

sudo nala install -y git sudo apt-utils sd jq curl

echo "Cloning stable Debian setup..."
sudo git clone -b main-ubuntu-server https://github.com/My-declarative-PC/linux-setup.git /var/lib/linux-setup

source /var/lib/linux-setup/setup.sh
