#!/bin/bash

PIDFILE="$HOME/.cache/waybar-hover.pid"
WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"
HOVER_SCRIPT="$HOME/.config/waybar/waybar-hover.sh"

# sanity checks
[[ -f "$WAYBAR_CONFIG" && -f "$WAYBAR_STYLE" ]] || exit 1

# if hover.sh is running
if [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  kill "$(cat "$PIDFILE")"
  rm -f "$PIDFILE"
  pkill -x waybar 2>/dev/null
  nohup "$HOVER_SCRIPT" >/dev/null 2>&1 &
else
  pkill -x waybar 2>/dev/null
  waybar -c "$WAYBAR_CONFIG" -s "$WAYBAR_STYLE" &
fi
