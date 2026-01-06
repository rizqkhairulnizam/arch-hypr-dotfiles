#!/bin/bash

STYLE_FILE="$HOME/.config/waybar/style.css"
RELOAD_SCRIPT="$HOME/.config/waybar/reload.sh"

# validate parameter
if [[ -z "$1" || ! "$1" =~ ^[0-9]+$ ]]; then
  echo "Usage: $0 <integer-px>"
  exit 1
fi

NEW_VALUE="$1"

# replace all border-radius values
sed -i "s/border-radius:[[:space:]]*[0-9]\+px;/border-radius: ${NEW_VALUE}px;/g" "$STYLE_FILE"

# reload waybar
"$RELOAD_SCRIPT"
