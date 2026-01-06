#!/bin/bash
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"
OPACITY="$1"

if ! [[ "$OPACITY" =~ ^0(\.[0-9]+)?$|^1(\.0+)?$ ]]; then
  echo "Invalid opacity value: $OPACITY"
  exit 1
fi

sed -i "s/^\s*inactive_opacity\s*=.*/inactive_opacity = $OPACITY/" "$CONFIG_FILE"
