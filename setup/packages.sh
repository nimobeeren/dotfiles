#/usr/bin/env bash
set -euo pipefail

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y git stow zsh curl make gettext gnome-tweaks dconf-cli vlc
