#!/bin/sh

source "$HOME/.config/.colors"

sketchybar --set "$NAME" label="$(date '+%Y/%m/%d %H:%M')" \
background.drawing=on  \
background.color=$WIN98_BRIGHT_GREY \
background.border_color=$BLACK \
background.border_width=1 \
background.shadow.drawing=on \
background.shadow.color=$WHITE \
background.shadow.angle=220 \
background.shadow.distance=2 \
background.height=25 \
label.padding_right=6 \
icon.padding_left=6 \



