#!/bin/sh
IMAGE_ID=image.$1
IMAGE=$2
sketchybar --add item $IMAGE_ID center \
           --set $IMAGE_ID label="🌊頑張って!!" label.drawing=off \
		   --set $IMAGE_ID background.drawing=on background.image="$HOME/.config/imgs/$IMAGE" background.image.drawing=on background.image.padding_left=2 background.image.padding_right=2\
		   --set $IMAGE_ID background.color=$WIN98_DARK_GREY background.border_width=1 background.border_color=$BLACK background.shadow.drawing=on background.shadow.color=$WHITE background.shadow.distance=2 background.shadow.angle=220 \
