#!/bin/bash

source /var/lib/linux-setup/common/command_exists.sh
source /var/lib/linux-setup/common/get_latest_version.sh
source /var/lib/linux-setup/common/check_font_installed.sh
PACK='Nerd Fonts'
print_installer_start $PACK

print_installer_step "Needed for font installer"
sudo nala install -y unzip wget

# Create directory for fonts if it doesn't exist
FONT_DIR=/usr/share/fonts
sudo mkdir -p $FONT_DIR

# Array of font names
fonts=(
    "CascadiaCode"
    "FiraCode"
    "JetBrainsMono"
    "RobotoMono"
)

URL=https://api.github.com/repos/ryanoasis/nerd-fonts/git/refs/tags
VERSION=$(get_latest_version $URL)

# Loop through each font, check if installed, and install if not
for font in "${fonts[@]}"
do
    if check_font_installed "$font" $FONT_DIR; then
        echo "Skipping installation of font: $font"
        continue  # Skip installation if font is already installed
    fi

    print_installer_step "Installing font: $font"
    TMP_FONT_DIR=/tmp/$font
    mkdir -p $TMP_FONT_DIR
    wget -q --show-progress "https://github.com/ryanoasis/nerd-fonts/releases/download/v${VERSION}/$font.zip" -P $TMP_FONT_DIR
    if [ $? -ne 0 ]; then
        echo "Failed to download font: $font"
        continue
    fi

    sudo unzip -q $TMP_FONT_DIR/$font.zip -d $FONT_DIR/$font/
    if [ $? -ne 0 ]; then
        echo "Failed to extract font: $font"
        continue
    fi

    rm $TMP_FONT_DIR/$font.zip
done

# Update font cache
fc-cache -f

print_installer_stop $PACK
