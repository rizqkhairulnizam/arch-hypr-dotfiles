#!/bin/sh

# this is an exec-once script for hyprland.conf

PIDFILE="$HOME/.cache/swayidle.pid"

# prevent duplicate instances
if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  exit 0
fi

command -v swayidle >/dev/null 2>&1 || exit 1

echo $$ >"$PIDFILE"
trap 'rm -f "$PIDFILE"' EXIT

exec swayidle -w \
  timeout 60 'swaylock -f' \
  timeout 90 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on'
