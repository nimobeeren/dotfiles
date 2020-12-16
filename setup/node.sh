#/usr/bin/env zsh
set -euo pipefail

# Use https://github.com/mklement0/n-install
# to install https://github.com/tj/n 
# to install node :)
# -y to for automated install
# -n to disable modifying .zshrc (already exports correct env vars)
curl -L https://raw.githubusercontent.com/mklement0/n-install/stable/bin/n-install | bash -s -- -yn

source $HOME/.zshrc

npm i -g yarn
