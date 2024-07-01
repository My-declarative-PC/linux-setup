#!/bin/bash

source /var/lib/debian-setup/common/command_exists.sh
source /var/lib/debian-setup/common/get_latest_version.sh
source /var/lib/debian-setup/common/check_font_installed.sh

echo "Needed for font installer"
nala install -y unzip

# Check if unzip is installed; if not, install it
if ! command_exists unzip; then
    echo "Installing unzip..."
    nala install unzip -y
fi

# Create directory for fonts if it doesn't exist
FONT_DIR=/usr/share/fonts
mkdir -p $FONT_DIR

# Array of font names
fonts=(
    "CascadiaCode"
    "FiraCode"
    "JetBrainsMono"
    "RobotoMono"
)

URL=https://api.github.com/repos/ryanoasis/nerd-fonts/tags
VERSION=$(get_latest_version $URL)

# Loop through each font, check if installed, and install if not
for font in "${fonts[@]}"
do
    if check_font_installed "$font"; then
        echo "Skipping installation of font: $font"
        continue  # Skip installation if font is already installed
    fi

    echo "Installing font: $font"
    wget -q --show-progress "https://github.com/ryanoasis/nerd-fonts/releases/download/v${VERSION}/$font.zip" -P /var/lib
    if [ $? -ne 0 ]; then
        echo "Failed to download font: $font"
        continue
    fi

    unzip -q /var/lib/$font.zip -d $FONT_DIR/$font/
    if [ $? -ne 0 ]; then
        echo "Failed to extract font: $font"
        continue
    fi

    rm /var/lib/$font.zip
done

# Update font cache
fc-cache -f

echo "Fonts installation completed."
