#!/bin/bash

print_installer_start() {
    local STRING_TO_PRINT=$1

    gum format "Install" "*${STRING_TO_PRINT}*" | \
    gum style                                     \
        --foreground 10                           \
        --border-foreground 10                    \
        --border double                           \
        --align center                            \
        --width $(($(tput cols) - 6))             \
        --margin "1 2"                            \
        --padding "2 4"
}

print_installer_stop() {
    local STRING_TO_PRINT=$1

    gum format "Installation finish" "*${STRING_TO_PRINT}*" | \
    gum style                                                 \
        --foreground 3                                        \
        --border-foreground 3                                 \
        --border double                                       \
        --align center                                        \
        --width $(($(tput cols) - 6))                         \
        --margin "1 2"
}

print_installer_step() {
    local STRING_TO_PRINT=$1

    gum format "Step" "*${STRING_TO_PRINT}*" | \
    gum style                                  \
        --foreground 23                        \
        --border-foreground 23                 \
        --align center                         \
        --width $(tput cols)
}
