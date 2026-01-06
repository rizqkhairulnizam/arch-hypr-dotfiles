#!/bin/sh

KITTY_SOCKET="$XDG_RUNTIME_DIR/kitty/kitty.sock"
CONFIG="$HOME/.config/kitty/kitty.conf"
CUSTOM="$HOME/.config/kitty/custom.conf"

OPACITY="$1"

# validate opacity
if ! [[ "$OPACITY" =~ ^0(\.[0-9]+)?$|^1(\.0+)?$ ]]; then
    echo "Invalid opacity value: $OPACITY"
    exit 1
fi

# update background opacity in custom config
sed -i "s/^background_opacity .*/background_opacity $OPACITY/" "$CUSTOM"

# reload Kitty to apply changes
if [ -S "$KITTY_SOCKET" ]; then
    kitty @ --to "unix:$KITTY_SOCKET" set-colors --all "$CONFIG"
else
    pidof kitty | xargs -r kill -USR1
fi

