#!/bin/bash

print_installer_start() {
    local STRING_TO_PRINT=$1

    gum format "Install" "*${STRING_TO_PRINT}*" | \
    gum style                     \
        --foreground 10           \
        --border-foreground 10    \
        --border double           \
        --align center            \
        --width 50                \
        --margin "1 2"            \
        --padding "2 4"
}
