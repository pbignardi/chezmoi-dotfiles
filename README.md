# Dotfiles 🏡
Dotfiles repo using [chezmoi](https://chezmoi.io).

I would like to target a few Linux distributions,
below is a table to keep track of what works as intended.

| OS | Works | Notes |
| --------------- | --------------- | --------------- |
| Arch |  |  |
| Debian |  |  |
| Ubuntu |  |  |
| Fedora |  |  |
| macOS |  |  |
| Windows WSL |  |  |


## Installation
On a new computer, use the command:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply pbignardi
```
This installs `chezmoi` in `~/bin` and initialize the new system with dotfiles and packages.
