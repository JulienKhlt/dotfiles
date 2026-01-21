#!/usr/bin/env bash

sketchybar --add event aerospace_workspace_change

sketchybar --add item current_workspace left \
  --subscribe current_workspace aerospace_workspace_change \
  --set current_workspace \
  background.color=0x44ffffff \
  background.corner_radius=5 \
  background.height=20 \
  background.drawing=on \
  background.padding_left=5 \
  label.padding_left=5 \
  padding_left=5 \
  icon.drawing=off \
  label="LOADING..." \
  click_script="aerospace_select_next_or_prev_workspace" \
  script="$CONFIG_DIR/plugins/aerospace.sh"
