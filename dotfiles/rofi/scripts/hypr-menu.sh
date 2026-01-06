#!/bin/bash

MODE=$(printf "Phantom\nWatermark\nTransparent\nStatic\nTOGGLE BLUR\nTOGGLE ROUNDING\nTOGGLE SWAYIDLE" |
  rofi -dmenu -i -p "󰗌" -theme "$HOME/.config/rofi/hypr-menu.rasi")

[ -z "$MODE" ] && exit

# If input is a number, use it directly
if [[ "$MODE" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  "$HOME/.config/hypr/hypr-style.sh" "$MODE"
  exit
fi

case "$MODE" in
"TOGGLE BLUR") "$HOME/.config/hypr/hypr-blur.sh" ;;
"TOGGLE ROUNDING") "$HOME/.config/hypr/hypr-radius.sh" ;;
"TOGGLE SWAYIDLE") "$HOME/.config/hypr/hypr-idletoggle.sh" ;;
"Static") "$HOME/.config/hypr/hypr-style.sh" 0.8 ;;
"Transparent") "$HOME/.config/hypr/hypr-style.sh" 0.4 ;;
"Watermark") "$HOME/.config/hypr/hypr-style.sh" 0.2 ;;
"Phantom") "$HOME/.config/hypr/hypr-style.sh" 0.0 ;;
*) exit 1 ;;
esac
