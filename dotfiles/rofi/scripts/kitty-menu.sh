#!/bin/bash

MODE=$(printf "Glass\nClear\nBase\nSolid\nCURSOR BLOCK\nCURSOR BEAM\nCURSOR UNDERLINE" |
  rofi -dmenu -i -p "󰄛" -theme "$HOME/.config/rofi/kitty-menu.rasi")

[ -z "$MODE" ] && exit

if [[ "$MODE" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  "$HOME/.config/kitty/kitty-style.sh" "$MODE"
  exit
fi

case "$MODE" in
"Glass") "$HOME/.config/kitty/kitty-style.sh" 0.0 ;;
"Clear") "$HOME/.config/kitty/kitty-style.sh" 0.4 ;;
"Base") "$HOME/.config/kitty/kitty-style.sh" 0.7 ;;
"Solid") "$HOME/.config/kitty/kitty-style.sh" 1.0 ;;
"CURSOR BLOCK") "$HOME/.config/kitty/kitty-cursor.sh" block ;;
"CURSOR BEAM") "$HOME/.config/kitty/kitty-cursor.sh" beam ;;
"CURSOR UNDERLINE") "$HOME/.config/kitty/kitty-cursor.sh" underline ;;
*) exit 1 ;;
esac
