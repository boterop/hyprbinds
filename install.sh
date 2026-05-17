#!/bin/bash

set -e

mkdir -p ~/.config/hypr/scripts

cp scripts/* ~/.config/hypr/scripts/
chmod +x ~/.config/hypr/scripts/hyprbinds.sh

if ! grep -q "hyprbinds.sh" ~/.config/hypr/hyprland.conf; then
    echo '' >> ~/.config/hypr/hyprland.conf
    echo '# hyprbinds - script' >> ~/.config/hypr/hyprland.conf
    echo 'bind = $mainMod, K, exec, ~/.config/hypr/scripts/hyprbinds.sh' >> ~/.config/hypr/hyprland.conf
fi

hyprctl reload

echo "hyprbinds installed successfully"