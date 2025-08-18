#!/bin/zsh

# Load defined icons
source "$CONFIG_DIR/icons.sh"

# Load defined colors
source "$CONFIG_DIR/colors.sh"

PADDINGS=23
FONT="JetBrainsMono Nerd Font"

# Bar Appearance
bar=(
  height=32
  color=0x00000000
  position=top
  topmost=off
  sticky=on
  padding_left=23
  padding_right=23
  corner_radius=0
  notch_width=188 
  display=main
)

# Item Defaults
item_defaults=(
  background.color=0x66494d64 
  background.corner_radius=5 \
  background.padding_right=5 \
  background.height=26 \
  icon.font="$FONT:Medium:15.0" \
  icon.padding_left=5
  icon.padding_right=5
  label.font="$FONT:Medium:12.0" \
  label.color=0xffcad3f5 \
  label.y_offset=0 \
  label.padding_left=0 
  label.padding_right=5
  # label.font="$FONT:Regular:12"
  # label.color=$LABEL_COLOR
  # label.highlight_color=$HIGHLIGHT
  updates=when_shown
  scroll_texts=on
)

notification_defaults=(
  drawing=off
  update_freq=120
  updates=on
  background.color="$(getcolor white 25)"
  background.height=16
  background.corner_radius=16
  icon.font.size=10
  icon.padding_left=$PADDINGS
  icon.padding_right=0
  icon.color="$(getcolor black 75)"
  label.color="$(getcolor black 75)"
  label.padding_right=$PADDINGS
  label.font.size=11
  label.font.style=Bold
)

bracket_defaults=(
  background.height=24
  background.color=$BAR_COLOR
  blur_radius=32
  background.corner_radius=$PADDINGS
)

menu_defaults=(
  popup.blur_radius=32
  popup.background.color=$POPUP_BACKGROUND_COLOR
  popup.background.corner_radius=$PADDINGS
  popup.background.shadow.drawing=on
)

menu_item_defaults=(
  label.font="$FONT:Regular:13"
  padding_left=$PADDINGS
  padding_right=$PADDINGS
  icon.padding_left=0
  # icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
)

separator=(
  background.height=1
  width=180
  background.color="$(getcolor white 25)"
  background.y_offset=-16
)
