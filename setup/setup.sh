#/usr/bin/env bash
set -euo pipefail

# Install software through package managers
./packages.sh
./apps.sh

# Install zsh and oh-my-zsh
./zsh.sh

# Symlink dotfiles
STOW_DIR=".." stow git mpd ssh zsh --target=$HOME

# Load GNOME settings and extensions
./desktop.sh

# Install node (needs to be run in zsh because it depends on vars set in .zshrc)
zsh ./node.sh
