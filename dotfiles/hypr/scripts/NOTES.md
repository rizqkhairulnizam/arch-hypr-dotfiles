## Notes

1. hypr-idle.sh is intended to be run once at startup. It is already called in hyprland.conf via exec-once.

2. hypr-idletoggle.sh toggles the idle behavior on/off dynamically.

3. hypr-blur.sh and hypr-radius.sh dynamically modify hyprland.conf without hardcoding line numbers.

4. hypr-style.sh expects an opacity value between 0.0 and 1.0 (e.g., 0.0, 0.4, 0.8, 1.0).

5. ALL SCRIPTS must have executable permission


## Config Paths

- Hyprland config file: $HOME/.config/hypr/hyprland.conf

- PID file for idle toggle: $HOME/.cache/swayidle.pid


