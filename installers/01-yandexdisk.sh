#!/bin/bash

source /var/lib/linux-setup/common/print_installer_start.sh
PACK="YandexDisk"
print_installer_start $PACK

TMP_PATH=/tmp/yandexdisk
mkdir -p $TMP_PATH

print_installer_step "Download ${PACK} archive"
cd $TMP_PATH
URL=http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb
echo "<<< ${URL} >>>"
curl -fL $URL -o yandexdisk.deb

print_installer_step "Install ${PACK}"
sudo dpkg -i yandexdisk.deb

print_installer_stop $PACK
