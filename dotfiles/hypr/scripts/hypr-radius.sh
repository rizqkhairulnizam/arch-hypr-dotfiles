#!/bin/bash
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"

awk '
  /decoration\s*{/ {in_decoration=1}
  in_decoration && match($0, /^\s*rounding\s*=\s*([0-9]+)/, arr) {
      $0 = (arr[1] == "0") ? gensub(/[0-9]+/, "10", "g") : gensub(/[0-9]+/, "0", "g")
  }
  /}/ && in_decoration { in_decoration=0 }
  {print}
' "$CONFIG_FILE" >"${CONFIG_FILE}.tmp" && mv "${CONFIG_FILE}.tmp" "$CONFIG_FILE"
