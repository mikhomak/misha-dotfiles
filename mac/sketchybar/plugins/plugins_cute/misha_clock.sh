#!/bin/sh

source "$HOME/.config/.colors"

sketchybar --set "$NAME" label="$(date '+%Y/%m/%d %H:%M')" \
background.drawing=on  \
background.color=$BLUE \
background.border_color=$PINK_DARK \
background.border_width=1 \
background.shadow.drawing=on \
background.shadow.color=$PINK_DARK \
background.shadow.angle=270 \
background.shadow.distance=15 \
background.height=25 \
background.corner_radius=5 \
label.padding_right=6 \
label.color=$BLACK \
icon.padding_left=6 \
icon.color=$BLACK \



