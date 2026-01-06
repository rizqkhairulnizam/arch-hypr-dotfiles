#!/bin/bash
PIDFILE="$HOME/.cache/swayidle.pid"
IDLE="$HOME/.config/hypr/hypr-idle.sh"

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  # disable
  kill "$(cat "$PIDFILE")"
  rm -f "$PIDFILE"
else
  # enable
  nohup "$IDLE" >/dev/null 2>&1 &
fi
