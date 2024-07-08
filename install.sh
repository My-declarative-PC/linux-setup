#!/bin/bash

echo "Needed for all installers"
sudo apt update
sudo apt upgrade -y
sudo apt install -y nala

sudo nala install -y git sudo apt-utils sd jq curl

echo "Cloning stable Debian setup..."
sudo git clone https://github.com/My-declarative-PC/debian-setup.git /var/lib/debian-setup

source /var/lib/debian-setup/setup.sh
