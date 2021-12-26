#/usr/bin/env bash
set -euo pipefail

# Install dash-to-dock extension
sudo apt install sassc
git clone https://github.com/micheleg/dash-to-dock.git dock
cd dock
make
make install
cd ..
rm -rf dock

# Load GNOME settings
dconf load /org/gnome/ < ../gnome.dconf
