#!/bin/sh

source "$HOME/.config/.colors"

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
    [6-9][0-9]|100) ICON="󰕾"
    ;;
    [3-5][0-9]) ICON="󰖀"
    ;;
    [1-9]|[1-2][0-9]) ICON="󰕿"
    ;;
    *) ICON="󰖁"
  esac

  sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%" \
background.drawing=on  \
background.color=$WIN98_BRIGHT_GREY \
background.border_color=$BLACK \
background.border_width=1 \
background.shadow.drawing=on \
background.shadow.color=$WHITE \
background.shadow.angle=220 \
background.shadow.distance=2 \
background.height=25 \
icon.padding_right=6 \
icon.padding_left=6 


fi
