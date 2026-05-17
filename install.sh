#!/bin/bash

set -e

mkdir -p ~/.config/hypr/scripts

SCRIPT_DIR="scripts"
CLEAN=false

if ! ls | grep -q "scripts"; then
  echo "Downloading scripts"
  git clone https://github.com/boterop/hyprbinds /tmp/hyprbinds
  SCRIPT_DIR="/tmp/hyprbinds/scripts"
fi

cp SCRIPT_DIR/* ~/.config/hypr/scripts/
chmod +x ~/.config/hypr/scripts/hyprbinds.sh

if ! grep -q "hyprbinds.sh" ~/.config/hypr/hyprland.conf; then
  echo '' >>~/.config/hypr/hyprland.conf
  echo '# hyprbinds - script' >>~/.config/hypr/hyprland.conf
  echo 'bind = $mainMod, K, exec, ~/.config/hypr/scripts/hyprbinds.sh' >>~/.config/hypr/hyprland.conf
fi

hyprctl reload

if CLEAN; then
  echo "Cleaning up"
  rm -rf /tmp/hyprbinds
fi

echo "hyprbinds installed successfully"
