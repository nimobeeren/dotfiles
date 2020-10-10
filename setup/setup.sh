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
STOW_DIR=".." stow git mpd ssh zsh --target=$HOME/test

# Load GNOME settings
dconf load /org/gnome < ../settings.dconf

# Install node
zsh ./node.sh
