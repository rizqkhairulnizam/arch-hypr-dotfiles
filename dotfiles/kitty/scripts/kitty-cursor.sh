#!/bin/sh

KITTY_SOCKET="$XDG_RUNTIME_DIR/kitty/kitty.sock"
CONFIG="$HOME/.config/kitty/kitty.conf"
CUSTOM="$HOME/.config/kitty/custom.conf"

CURSOR="$1"

if [ -z "$CURSOR" ]; then
  echo "Usage: $0 <cursor_shape>"
  echo "Valid values: block, beam, underline"
  exit 1
fi

# update cursor shape in custom config
sed -i "s/^cursor_shape .*/cursor_shape $CURSOR/" "$CUSTOM"

# reload Kitty to apply changes
if [ -S "$KITTY_SOCKET" ]; then
  kitty @ --to "unix:$KITTY_SOCKET" set-colors --all "$CONFIG"
else
  pidof kitty | xargs -r kill -USR1
fi
