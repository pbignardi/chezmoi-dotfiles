#!/usr/bin/env bash

# Install packages using apt package manager
# Paolo Bignardi - 2025

function is_wsl() {
    test $(which powershell.exe)
}

echo "Refresh repositories"
sudo pacman -Syu --noconfirm

# Core packages
echo "Installing core packages"
sudo pacman -Syu --noconfirm --needed - <<EndOfFile
git
stow
jq
unzip
zsh
gcc
go
npm
curl
wget
openssh-client
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

if ! systemctl is-active --quiet reflector; then
    _log "Use REFLECTOR to select best mirrors"
    echo "--country France,Germany,Italy" | sudo tee -a /etc/xdg/reflector/reflector.conf
    sudo systemctl enable --now reflector
fi

# Install paru
if ! command -v paru %2 >/dev/null; then
    echo "Install Paru"
    old_wd=$(pwd)
    cd $LOCALSRC
    git clone https://aur.archlinux.org/paru-bin.git paru-bin
    cd paru-bin
    makepkg -si
    cd $old_wd
fi

# Only non-WSL packages
is_wsl && return

echo "Installing extra packages"
sudo pacman -Syu --noconfirm --needed - <<EndOfFile
alacritty
wezterm
ttf-nerd-fonts-symbols-mono
distrobox
podman
EndOfFile
