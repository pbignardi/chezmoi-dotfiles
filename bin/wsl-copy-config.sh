#!/usr/bin/env bash
echo "Copying config files to Windows directories"

USERNAME=$(/mnt/c/WINDOWS/system32/cmd.exe /c echo %USERNAME% 2>/dev/null | tr -d "\r\n")

# copy wezterm config files
cp -r ~/.config/wezterm/ /mnt/c/Users/$USERNAME/AppData/Local/

# copy alacritty config files
cp -r ~/.config/alacritty/ /mnt/c/Users/$USERNAME/AppData/Roaming/
