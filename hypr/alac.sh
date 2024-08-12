#!/bin/bash

# Define the path to your Alacritty config
ALACRITTY_CONFIG_PATH="$HOME/.config/alacritty/colors.toml"

# Use Pywal's color JSON to generate the Alacritty color scheme in TOML format
cat <<EOF > $ALACRITTY_CONFIG_PATH
[colors]
  [colors.primary]
    background = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0')"
    foreground = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color7')"

  [colors.normal]
    black   = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color0')"
    red     = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color1')"
    green   = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color2')"
    yellow  = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color3')"
    blue    = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color4')"
    magenta = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color5')"
    cyan    = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color6')"
    white   = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color7')"

  [colors.bright]
    black   = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color8')"
    red     = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color9')"
    green   = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color10')"
    yellow  = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color11')"
    blue    = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color12')"
    magenta = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color13')"
    cyan    = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color14')"
    white   = "$(cat ~/.cache/wal/colors.json | jq -r '.colors.color15')"

EOF

