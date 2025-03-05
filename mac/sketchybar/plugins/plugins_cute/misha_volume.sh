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
background.color=$BLUE_LIGHT \
background.border_color=$PINK_DARK \
background.border_width=1 \
background.shadow.drawing=on \
background.shadow.color=$PINK_DARK \
background.shadow.angle=270 \
background.shadow.distance=15 \
background.height=25 \
icon.padding_right=6 \
icon.padding_left=6 


fi
