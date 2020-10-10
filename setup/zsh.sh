#/usr/bin/env bash
set -euo pipefail

# Install zsh and oh-my-zsh
sudo chsh -s /usr/bin/zsh $(whoami) # sudo so it doesn't ask for password again
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm $HOME/.zshrc  # remove default .zshrc because we have our own
