#!/bin/bash

echo "Add Gum's official GPG key"
mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | gpg --dearmor -o /etc/apt/keyrings/charm.gpg

echo "Add the repository to Apt sources"
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | tee /etc/apt/sources.list.d/charm.list

echo "Install the latest version Gum packages"
nala update
nala install -y gum

gum style                   \
    --foreground 212        \
    --border-foreground 212 \
    --border double         \
    --align center          \
    --width 50              \
    --margin "1 2"          \
    --padding "2 4"         \
    'Congratulations!!!' '`Gum` installed successfully'
