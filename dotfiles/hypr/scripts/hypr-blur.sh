#!/bin/bash
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"

awk '
  /blur\s*{/ {in_blur=1}
  in_blur && match($0, /^\s*enabled\s*=\s*(true|false)/, arr) {
      $0 = ($0 ~ /true/) ? gensub(/true/, "false", "g") : gensub(/false/, "true", "g")
  }
  /}/ && in_blur { in_blur=0 }
  {print}
' "$CONFIG_FILE" >"${CONFIG_FILE}.tmp" && mv "${CONFIG_FILE}.tmp" "$CONFIG_FILE"
