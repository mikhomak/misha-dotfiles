#!/bin/sh

source "$HOME/.config/.colors"

if [ $SELECTED = true ]; then
	sketchybar --set "$NAME" background.color=$WIN98_BRIGHT_GREY \
		background.border_color=$BLACK \
		background.border_width=1 \
		background.shadow.angle=30
else
	sketchybar --set "$NAME" background.color=$WIN98_GREY \
		background.border_color=$BLACK \
		background.border_width=1 \
		background.shadow.angle=220
fi
