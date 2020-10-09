#/usr/bin/env zsh
set -euo pipefail

# Use https://github.com/mklement0/n-install
# to install https://github.com/tj/n 
# to install node :)
curl -L https://raw.githubusercontent.com/mklement0/n-install/stable/bin/n-install | SHELL=zsh bash -s -- -y

source $HOME/.zshrc

npm i -g yarn
