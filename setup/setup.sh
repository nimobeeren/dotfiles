#/usr/bin/env bash
set -euo pipefail

# Install software through package managers
./packages.sh
./apps.sh

# Install zsh and oh-my-zsh
sudo chsh -s /usr/bin/zsh $(whoami) # sudo so it doesn't ask for password again
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Symlink dotfiles
export STOW_DIR=".." # where the dotfiles come from
export TARGET_DIR=$HOME # where the dotfiles go
stow git --target=$TARGET_DIR
stow mpd --target=$TARGET_DIR
stow ssh --target=$TARGET_DIR
rm $TARGET_DIR/.zshrc && stow zsh --target=$TARGET_DIR

# Install node
zsh ./node.sh
