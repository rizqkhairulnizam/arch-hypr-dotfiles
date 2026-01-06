## Script Overview

- waybar-hover.sh
Auto-shows and hides Waybar based on cursor Y position.

- waybar-hover-toggle.sh
Toggles hover behavior on or off.

- reload.sh
Reloads Waybar while preserving hover state.

- waybar-radius.sh
Dynamically changes CSS border radius and reloads Waybar.

- waybar-pos.sh
Toggles Waybar position (top/bottom) and updates hover logic.


## Notes

1. Some scripts are invoked indirectly:

- waybar-hover.sh may be launched via exec-once in hyprland.conf.

- reload.sh is called internally by other Waybar scripts.

- Waybar modules and actions may reference these scripts from config.jsonc.

2. waybar-hover.sh uses a PID file to prevent duplicate instances.

3. Hover logic depends on screen resolution; HOVER_Y may require manual adjustment.

4. Scripts assume a single Waybar instance at runtime.

5. ALL SCRIPTS must have executable permission.


## Config Paths

- Waybar config: $HOME/.config/waybar/config.jsonc

- Waybar styles: $HOME/.config/waybar/style.css

- Hover PID file: $HOME/.cache/waybar-hover.pid

## Warnings

- Modifying config.jsonc or waybar-hover.sh while Waybar is running may require a manual reload.

- Multi-monitor setups may require per-monitor hover logic adjustments.
