#!/bin/bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
case $INFO in
"Arc")
    ICON_PADDING_RIGHT=5
    ICON=󰞍
    ;;
"Code")
    ICON_PADDING_RIGHT=4
    ICON=󰨞
    ;;
"iTerm2")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Slack")
    ICON_PADDING_RIGHT=4
    ICON=󰒱
    ;;
"Obsidian")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Zotero")
    ICON_PADDING_RIGHT=4
    ICON=󰬡
    ;;
"Dashlane")
    ICON_PADDING_RIGHT=4
    ICON=󰯵
    ;;
"Todoist")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Calendar")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Discord")
    ICON=󰙯
    ;;
"FaceTime")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
"Finder")
    ICON=󰀶
    ICON_PADDING_RIGHT=5
    ;;
"Google Chrome")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
"IINA")
    ICON_PADDING_RIGHT=4
    ICON=󰕼
    ;;
"kitty")
    ICON=󰄛
    ;;
"Messages")
    ICON=󰍦
    ;;
"Notion")
    ICON_PADDING_RIGHT=6
    ICON=󰰒
    ;;
"Preview")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"PS Remote Play")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Spotify")
    ICON=
    ;;
"TextEdit")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Transmission")
    ICON_PADDING_RIGHT=3
    ICON=󰶘
    ;;
*)
    ICON=﯂
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
  # sketchybar --set $NAME label="$INFO" # icon.background.image="app.$INFO"
fi
