#!/bin/bash

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

github_bell=(
  update_freq=180
  icon.font="$FONT:Bold:15.0"
  icon=󰂚
  icon.color=0xff8aadf4
  label=$LOADING
  label.highlight_color=0xff8aadf4
  popup.align=right
  script="$PLUGIN_DIR/github.sh"
  click_script="$POPUP_CLICK_SCRIPT"
)

github_template=(
  drawing=off
  background.corner_radius=12
  background.color=$POPUP_BACKGROUND_COLOR
  background.drawing=on
  padding_left=0
  padding_right=0
  icon.background.height=2
  icon.background.y_offset=-1
)

sketchybar --add item github.bell right                 \
           --set github.bell "${github_bell[@]}"        \
           --subscribe github.bell  mouse.entered       \
                                    mouse.exited        \
                                    mouse.exited.global \
                                                        \
           --add item github.template popup.github.bell \
           --set github.template "${github_template[@]}"
