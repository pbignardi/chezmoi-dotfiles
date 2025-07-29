#!/usr/bin/env bash

# Configure Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install flatpak packages
flatpak install flathub com.bitwarden.desktop
flatpak install flathub com.github.ahrm.sioyek
