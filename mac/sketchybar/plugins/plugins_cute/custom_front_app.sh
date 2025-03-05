#!/bin/sh
source "$HOME/.config/.colors"

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="<<< $INFO >>>" \
	label.color=$BLACK \
	label.font="AurulentSansM Nerd Font Propo"\
	label.font.size=14 \
	background.drawing=on \
	background.border_color=$PINK_DARK \
	background.border_width=1 \
	background.color=$BLUE_LIGHT \
	background.height=25 \
	background.corner_radius=5\
	background.shadow.drawing=on \
	background.shadow.color=$PINK_DARK\
	background.shadow.angle=270\
	background.shadow.distance=10
fi
