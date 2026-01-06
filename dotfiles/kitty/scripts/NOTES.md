## Notes

1. kitty-style.sh modifies the background opacity dynamically in custom.conf.

- Acceptable values: 0.0 (glass) to 1.0 (solid).

2. kitty-cursor.sh modifies the cursor shape dynamically in custom.conf.

- Valid values: block, beam, underline.

3. Both scripts reload Kitty automatically using the socket (kitty @) if available, or send USR1 signal to running Kitty instances otherwise.

4. kitty.conf is the main configuration file, while custom.conf contains dynamic modifications applied by these scripts.

5. ALL SCRIPTS must have executable permission


## Config Paths

- Kitty main config: $HOME/.config/kitty/kitty.conf

- Kitty custom config: $HOME/.config/kitty/custom.conf

- Kitty runtime socket: $XDG_RUNTIME_DIR/kitty/kitty.sock
