#!/bin/bash

PIDFILE="$HOME/.cache/waybar-hover.pid"
WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"

# prevent duplicate instances
if [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  exit 0
fi

echo $$ >"$PIDFILE"
trap 'rm -f "$PIDFILE"' EXIT

HOVER_Y=30
INTERVAL=0.1
WAYBAR_RUNNING=0
WAYBAR_PID=0

while true; do
  CURSOR_Y=$(hyprctl cursorpos | grep -oP ',\s*\K[0-9]+')
  [[ -z "$CURSOR_Y" ]] && sleep "$INTERVAL" && continue

  if ((CURSOR_Y < HOVER_Y)); then
    if ((WAYBAR_RUNNING == 0)); then
      waybar -c "$WAYBAR_CONFIG" -s "$WAYBAR_STYLE" &
      WAYBAR_PID=$!
      WAYBAR_RUNNING=1
    fi
  else
    if ((WAYBAR_RUNNING == 1)); then
      kill "$WAYBAR_PID" 2>/dev/null
      WAYBAR_RUNNING=0
    fi
  fi

  sleep "$INTERVAL"
done
