#/usr/bin/env bash
set -euo pipefail

# Install software through package managers
./packages.sh
./apps.sh

# Install zsh and oh-my-zsh
sudo chsh -s /usr/bin/zsh $(whoami) # sudo so it doesn't ask for password again
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Symlink dotfiles
rm $HOME/.zshrc
STOW_DIR=".." stow git mpd ssh zsh --target=$HOME

./desktop.sh

# Install node (needs to be run in zsh because it depends on vars set in .zshrc)
zsh ./node.sh
