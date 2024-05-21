#!/bin/sh
source "$HOME/.config/.colors"

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="٩(◕‿◕)۶ <<< $INFO >>> ٩(◕‿◕)۶" \
	label.color=$WHITE \
	label.font="AurulentSansM Nerd Font Propo"\
	label.font.size=14 \
	background.drawing=on \
	background.border_color=$BLACK \
	background.border_width=1 \
	background.color=$WIN98_BLUE \
	background.height=25 \
	background.shadow.drawing=on \
	background.shadow.color=$WHITE\
	background.shadow.angle=220\
	background.shadow.distance=2
fi
