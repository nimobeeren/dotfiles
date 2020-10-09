#/usr/bin/env bash
set -euo pipefail

# Install software through package managers
./packages.sh
./apps.sh

# Install zsh and oh-my-zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Symlink dotfiles
STOW_DIR=".." stow git --target=$HOME
STOW_DIR=".." stow mpd --target=$HOME
STOW_DIR=".." stow ssh --target=$HOME
rm $HOME/.zshrc && STOW_DIR=".." stow zsh --target=$HOME

# Install node
zsh ./node.sh
