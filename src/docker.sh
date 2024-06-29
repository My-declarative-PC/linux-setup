#!/bin/bash

source /tmp/debian-setup/common/pretty_print.sh
pretty_print 'Install *Docker*'

echo "Needed for docker installer"
nala install -y ca-certificates curl

echo "Add Docker's official GPG key"
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo "Add the repository to Apt sources"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
nala update

echo "Install the latest version Docker packages"
nala install -y           \
     docker-ce            \
     docker-ce-cli        \
     containerd.io        \
     docker-buildx-plugin \
     docker-compose-plugin
