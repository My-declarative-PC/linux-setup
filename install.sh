#!/bin/bash

echo "Needed for all installers"
apt update -y
apt install -y nala

nala install -y git sudo

echo "Cloning stable Debian setup..."
git clone https://github.com/My-declarative-PC/debian-setup.git /tmp/debian-setup

source /tmp/debian-setup/setup.sh
