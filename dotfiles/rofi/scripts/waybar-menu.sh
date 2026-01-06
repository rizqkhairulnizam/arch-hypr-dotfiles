#!/bin/bash

MODE=$(printf "Circular\nRounded\nSquared\nTOGGLE HOVER\nTOGGLE POSITION" |
  rofi -dmenu -i -p "" -theme "$HOME/.config/rofi/waybar-menu.rasi")

[ -z "$MODE" ] && exit

if [[ "$MODE" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  "$HOME/.config/waybar/waybar-radius.sh" "$MODE"
  exit
fi

case "$MODE" in
"Circular") "$HOME/.config/waybar/waybar-radius.sh" 20 ;;
"Rounded") "$HOME/.config/waybar/waybar-radius.sh" 10 ;;
"Squared") "$HOME/.config/waybar/waybar-radius.sh" 5 ;;
"TOGGLE HOVER") "$HOME/.config/waybar/waybar-hover-toggle.sh" ;;
"TOGGLE POSITION") "$HOME/.config/waybar/waybar-pos.sh" ;;
*) exit 1 ;;
esac
