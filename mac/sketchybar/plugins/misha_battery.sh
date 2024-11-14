#!/bin/sh

source "$HOME/.config/.colors"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON=""
  ;;
  [6-8][0-9]) ICON=""
  ;;
  [3-5][0-9]) ICON=""
  ;;
  [1-2][0-9]) ICON=""
  ;;
  *) ICON=""
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=""
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" \
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


