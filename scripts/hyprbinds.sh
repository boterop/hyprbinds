#!/bin/bash

grep "^bind" ~/.config/hypr/hyprland.conf |
  sed 's/bind = //' |
  rofi -dmenu -theme ~/.config/hypr/scripts/theme.rasi -i -p "Hyprland Keybinds"
