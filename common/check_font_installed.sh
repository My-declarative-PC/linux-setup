#!/bin/bash

# Function to check if font directory exists
check_font_installed() {
    font_name=$1
    FONT_DIR=$2
    if [ -d $FONT_DIR/$font_name ]; then
        echo "Font $font_name is already installed. Skipping."
        return 0  # Font already installed
    else
        return 1  # Font not installed
    fi
}
