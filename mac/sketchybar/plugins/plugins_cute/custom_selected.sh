#!/bin/sh

source "$HOME/.config/.colors"

if [ $SELECTED = true ]; then
	sketchybar --set "$NAME" background.color=$PINK_LIGHT \
		background.border_color=$PINK_DARK \
		background.border_width=1 \
		background.shadow.angle=270 \
		background.shadow.distance=15\
		background.corner_radius=7 \
		icon.color=$WIN98_BLUE
else
	sketchybar --set "$NAME" background.color=$BLUE_LIGHT \
		background.border_color=$PINK_DARK \
		background.border_width=1 \
		background.shadow.angle=90 \
		background.shadow.distance=1\
		background.corner_radius=5 \
		icon.color=$BLACK
fi
