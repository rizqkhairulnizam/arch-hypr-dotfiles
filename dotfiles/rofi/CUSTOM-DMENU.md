## Custom dmenu setup

This document describes how launcher-driven menus (rofi dmenu) act as a unified control layer for window manager, bar, and terminal behavior by dispatching small, custom-made, single-responsibility shell scripts.

It is a side project that I thought was really cool so here is a detailed overview of what it is and how to use it. Let's hope I'm doing this right.

## Structural Overview
```
[ rofi / dmenu ]
        |
        v
[ dispatcher scripts ]
        |
        v
+------------------------------+
| Hyprland | Waybar | Kitty    |
+------------------------------+
```
- rofi/dmenu: UI only (no logic)

- scripts: state toggling, validation, reloads

- configs: remain source-of-truth, scripts mutate them safely


## Integration Philosophy

1. No script directly calls rofi/dmenu

2. Menus only call scripts

3. Scripts:

- validate input

- modify config files

- reload or signal services

4. State is inferred from config, not stored separately

## Script Groupings
### Hyprland Controls
```

Triggered via rofi:

hypr-blur.sh → toggle blur block

hypr-radius.sh → toggle rounding

hypr-style.sh <opacity> → set inactive opacity

hypr-idletoggle.sh → toggle swayidle workflow
```

Notes:

1. Some scripts are invoked indirectly via exec-once in hyprland.conf

2. swayidle lifecycle is PID-managed

### Waybar Controls
```
Triggered via rofi:

waybar-hover-toggle.sh → enable/disable hover mode

waybar-pos.sh → top/bottom switch

waybar-radius.sh <px> → UI rounding

reload.sh → safe restart preserving hover logic
```

Notes:

1. Hover behavior relies on cursor polling via hyprctl

2.  Waybar may be launched:

- directly

- via hover script

- via Hyprland exec-once

### Kitty Controls
```
Triggered via rofi:

kitty-style.sh <opacity> → background opacity

kitty-cursor.sh <shape> → cursor shape
```

Notes:

1. Uses Kitty remote control when socket exists

2. Falls back to SIGUSR1 reload

3. ALL ALTERATIONS happen in custom.conf which extends kitty.conf.