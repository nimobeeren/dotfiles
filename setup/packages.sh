#/usr/bin/env bash
set -euo pipefail

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y git zsh curl make gettext gnome-tweaks mpd
