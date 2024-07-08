mkdir -p /etc/distrobox
echo 'container_manager="docker"' > /etc/distrobox/distrobox.conf

distrobox-create --root --name tools --image ghcr.io/ublue-os/arch-distrobox --yes

distrobox-enter --root --name tools -- ' paru -Suuy --noconfirm'

distrobox-enter --root --name tools -- ' paru -S helix starship fish zoxide eza zellij stow lazygit git fastfetch --noconfirm'

distrobox-enter --root --name tools -- ' distrobox-export --bin /usr/bin/starship --export-path /usr/bin/starship'
distrobox-enter --root --name tools -- ' distrobox-export --bin /usr/bin/fastfetch --export-path /usr/bin/fastfetch'
distrobox-enter --root --name tools -- ' distrobox-export --bin /usr/bin/zoxide --export-path /usr/bin/zoxide'
distrobox-enter --root --name tools -- ' distrobox-export --bin /usr/bin/eza --export-path /usr/bin/eza'

distrobox-enter --root --name tools -- ' ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker'
distrobox-enter --root --name tools -- ' ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak'
distrobox-enter --root --name tools -- ' ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/nala'
