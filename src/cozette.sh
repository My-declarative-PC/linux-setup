#!/bin/bash

source /var/lib/debian-setup/common/print_installer_start.sh
source /var/lib/debian-setup/common/get_latest_version.sh

print_installer_start 'Cozette font'

echo "Needed for docker installer"
nala install -y unzip

TMP_PATH=/var/lib/cozette
mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/slavfox/Cozette/tags
VERSION=$(get_latest_version $URL)
UNDERSCORE_VERSION=$(echo $VERSION | sed 's/\./-/g')
URL=https://github.com/slavfox/Cozette/releases/download/v${VERSION}/CozetteFonts-v-${UNDERSCORE_VERSION}.zip
echo "<<< ${URL} >>>"
curl -fL $URL -o CozetteFonts.zip

unzip Coz*
rm *zip

mv Coz* /usr/share/fonts

rm -rf $TMP_PATH
