#!/bin/bash

echo "Needed before setup"
sudo apt update
sudo apt upgrade -y
sudo apt install -y git

echo "Cloning stable Debian setup..."
sudo git clone -b dev-mint-i3 https://github.com/My-declarative-PC/linux-setup.git /var/lib/linux-setup

source /var/lib/linux-setup/setup.sh
