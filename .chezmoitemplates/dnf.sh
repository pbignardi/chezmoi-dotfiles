#!/usr/bin/env bash

# Install packages using dnf package manager
# Paolo Bignardi - 2025

function is_wsl() {
    test $(which powershell.exe)
}

echo "Refresh repositories"
sudo dnf upgrade

# Core packages
echo "Installing core packages"
sudo dnf install -y $(cat << EndOfFile
git
stow
jq
unzip
zsh
gcc
go
gum
nodejs-npm
curl
wget
openssh
flatpak

neovim
fzf
tmux
fd
ripgrep
bat
btop
zathura
zathura-pdf-poppler
EndOfFile
)

# Only non-WSL packages
is_wsl && return

echo "Installing extra packages"

sudo dnf copr enable wezfurlong/wezterm-nightly
sudo dnf install -y wezterm

sudo dnf install -y $(cat << EndOfFile
alacritty
distrobox
podman
EndOfFile
)
