#!/bin/bash

pretty_print() {
    local STRING_TO_PRINT=$1

    gum format $STRING_TO_PRINT | \
    gum style                     \
        --foreground 212          \
        --border-foreground 212   \
        --border double           \
        --align center            \
        --width 50                \
        --margin "1 2"            \
        --padding "2 4"
}
