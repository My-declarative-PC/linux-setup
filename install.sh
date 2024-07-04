#!/bin/bash

echo "Needed for all installers"
apt update -y
apt install -y nala

nala install -y git sudo apt-utils sd jq curl

echo "Cloning stable Debian setup..."
git clone https://github.com/My-declarative-PC/debian-setup.git /var/lib/debian-setup

source /var/lib/debian-setup/setup.sh
