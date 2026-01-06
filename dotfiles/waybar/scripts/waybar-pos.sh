#!/bin/bash

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"
HOVER_SCRIPT="$HOME/.config/waybar/waybar-hover.sh"
RELOAD_SCRIPT="$HOME/.config/waybar/reload.sh"

# sanity checks
[[ -f "$WAYBAR_CONFIG" && -f "$HOVER_SCRIPT" ]] || exit 1

CURRENT_POSITION=$(sed -n '0,/"position": /s/.*"position": "\([^"]*\)".*/\1/p' "$WAYBAR_CONFIG")

if [[ "$CURRENT_POSITION" == "top" ]]; then
  sed -i '0,/"position": /s/"position": "top"/"position": "bottom"/' "$WAYBAR_CONFIG"
  sed -i 's/^HOVER_Y=[0-9]\+/HOVER_Y=1045/' "$HOVER_SCRIPT"
  sed -i 's/if ((CURSOR_Y < HOVER_Y)); then/if ((CURSOR_Y > HOVER_Y)); then/' "$HOVER_SCRIPT"

elif [[ "$CURRENT_POSITION" == "bottom" ]]; then
  sed -i '0,/"position": /s/"position": "bottom"/"position": "top"/' "$WAYBAR_CONFIG"
  sed -i 's/^HOVER_Y=[0-9]\+/HOVER_Y=30/' "$HOVER_SCRIPT"
  sed -i 's/if ((CURSOR_Y > HOVER_Y)); then/if ((CURSOR_Y < HOVER_Y)); then/' "$HOVER_SCRIPT"
fi

"$RELOAD_SCRIPT"
