#!/bin/bash

update() {
  if [ -n "$CONFIG_DIR" ] && [ -f "$CONFIG_DIR/colors.sh" ]; then
    source "$CONFIG_DIR/colors.sh"
  else
    source colors.sh
  fi
  if [ -n "$CONFIG_DIR" ] && [ -f "$CONFIG_DIR/icons.sh" ]; then
    source "$CONFIG_DIR/icons.sh"
  fi

  : "${RED:=0xffff0000}"
  : "${MAGENTA:=0xffb162f7}"
  : "${GIT_PULL_REQUEST:=󰂡}"
  : "${HIGHLIGHT_25:=0xff000000}"
  : "${HIGHLIGHT_50:=0xff000000}"

  GH_BIN="$(command -v gh || true)"
  if [ -z "$GH_BIN" ]; then
    for CANDIDATE in /opt/homebrew/bin/gh /usr/local/bin/gh; do
      if [ -x "$CANDIDATE" ]; then
        GH_BIN="$CANDIDATE"
        break
      fi
    done
  fi
  if [ -z "$GH_BIN" ]; then
    sketchybar --set $NAME icon=󰂚 label="!" icon.color=$RED
    return
  fi

  USER="${GITHUB_REVIEW_USER:-$($GH_BIN api user -q .login 2>/dev/null)}"
  TEAM_LIST="${GITHUB_REVIEW_TEAMS:-}"
  LIMIT="${GITHUB_REVIEW_LIMIT:-5}"
  if ! [[ "$LIMIT" =~ ^[0-9]+$ ]]; then
    LIMIT=5
  fi

  PERSONAL_COUNT=0
  if [ -n "$USER" ]; then
    PERSONAL_COUNT="$($GH_BIN api -X GET /search/issues -f q="is:pr is:open review-requested:$USER" -q .total_count 2>/dev/null || echo 0)"
  fi
  PERSONAL_COUNT="${PERSONAL_COUNT:-0}"

  TEAM_COUNT=0
  TEAM_LINES=()
  if [ -n "$TEAM_LIST" ]; then
    IFS=',' read -r -a TEAMS <<< "$TEAM_LIST"
    for TEAM in "${TEAMS[@]}"; do
      TEAM="$(echo "$TEAM" | xargs)"
      [ -z "$TEAM" ] && continue
      COUNT="$($GH_BIN api -X GET /search/issues -f q="is:pr is:open team-review-requested:$TEAM" -q .total_count 2>/dev/null || echo 0)"
      COUNT="${COUNT:-0}"
      TEAM_COUNT=$((TEAM_COUNT + COUNT))
      TEAM_LINES+=("$TEAM:$COUNT")
    done
  fi

  COUNT=$((PERSONAL_COUNT + TEAM_COUNT))
  args=()
  args+=(--set $NAME icon=󰂚 label="$COUNT")

  PREV_COUNT=$(sketchybar --query github.bell | jq -r .label.value)
  # For sound to play around with:
  # afplay /System/Library/Sounds/Morse.aiff

  args+=(--remove '/github.notification\.*/')

  COUNTER=0
  COLOR=$MAGENTA
  args+=(--set github.bell icon.color=$COLOR)

  if [ -n "$USER" ] || [ -n "$TEAM_LIST" ]; then
    COUNTER=$((COUNTER + 1))
    notification=(
      label="Your reviews: $PERSONAL_COUNT"
      icon="$GIT_PULL_REQUEST"
      icon.padding_left="0"
      label.padding_right="0"
      icon.color=$MAGENTA
      position=popup.github.bell
      icon.background.color=$MAGENTA
      drawing=on
      click_script="open https://github.com/pulls/review-requested; sketchybar --set github.bell popup.drawing=off"
    )
    args+=(--clone github.notification.$COUNTER github.template \
           --set github.notification.$COUNTER "${notification[@]}")

    if [ -n "$USER" ] && [ "$LIMIT" -gt 0 ] 2>/dev/null; then
      DETAILS="$($GH_BIN api -X GET /search/issues \
        -f q="is:pr is:open review-requested:$USER" \
        -f per_page="$LIMIT" -f page=1 \
        -q '.items[] | [.repository_url, .title, .html_url] | @tsv' 2>/dev/null)"
      if [ -z "$DETAILS" ]; then
        COUNTER=$((COUNTER + 1))
        notification=(
          label="No PR details found"
          icon="$GIT_PULL_REQUEST"
          icon.padding_left="0"
          label.padding_right="0"
          icon.color=$MAGENTA
          position=popup.github.bell
          icon.background.color=$MAGENTA
          drawing=on
        )
        args+=(--clone github.notification.$COUNTER github.template \
               --set github.notification.$COUNTER "${notification[@]}")
      fi
      while IFS=$'\t' read -r repo_url title url; do
        [ -z "$repo_url" ] && continue
        COUNTER=$((COUNTER + 1))
        owner_repo="${repo_url#*repos/}"
        notification=(
          label="$owner_repo: $title"
          icon="$GIT_PULL_REQUEST"
          icon.padding_left="0"
          label.padding_right="0"
          label.max_chars=80
          icon.color=$MAGENTA
          position=popup.github.bell
          icon.background.color=$MAGENTA
          drawing=on
          click_script="open $url; sketchybar --set github.bell popup.drawing=off"
        )
        args+=(--clone github.notification.$COUNTER github.template \
               --set github.notification.$COUNTER "${notification[@]}")
      done <<< "$DETAILS"
    fi
  else
    COUNTER=$((COUNTER + 1))
    notification=(
      label="Set GITHUB_REVIEW_TEAMS or GITHUB_REVIEW_USER"
      icon="$GIT_PULL_REQUEST"
      icon.padding_left="0"
      label.padding_right="0"
      icon.color=$MAGENTA
      position=popup.github.bell
      icon.background.color=$MAGENTA
      drawing=on
    )
    args+=(--clone github.notification.$COUNTER github.template \
           --set github.notification.$COUNTER "${notification[@]}")
  fi

  for LINE in "${TEAM_LINES[@]}"; do
    COUNTER=$((COUNTER + 1))
    TEAM_NAME="${LINE%%:*}"
    TEAM_VAL="${LINE##*:}"
    notification=(
      label="$TEAM_NAME: $TEAM_VAL"
      icon="$GIT_PULL_REQUEST"
      icon.padding_left="0"
      label.padding_right="0"
      icon.color=$MAGENTA
      position=popup.github.bell
      icon.background.color=$MAGENTA
      drawing=on
      click_script="open https://github.com/pulls/review-requested; sketchybar --set github.bell popup.drawing=off"
    )
    args+=(--clone github.notification.$COUNTER github.template \
           --set github.notification.$COUNTER "${notification[@]}")

    if [ "$TEAM_VAL" -gt 0 ] 2>/dev/null && [ "$LIMIT" -gt 0 ] 2>/dev/null; then
      DETAILS="$($GH_BIN api -X GET /search/issues \
        -f q="is:pr is:open team-review-requested:$TEAM_NAME" \
        -f per_page="$LIMIT" -f page=1 \
        -q '.items[] | [.repository_url, .title, .html_url] | @tsv' 2>/dev/null)"
      if [ -z "$DETAILS" ]; then
        COUNTER=$((COUNTER + 1))
        notification=(
          label="$TEAM_NAME: no PR details found"
          icon="$GIT_PULL_REQUEST"
          icon.padding_left="0"
          label.padding_right="0"
          label.max_chars=80
          icon.color=$MAGENTA
          position=popup.github.bell
          icon.background.color=$MAGENTA
          drawing=on
        )
        args+=(--clone github.notification.$COUNTER github.template \
               --set github.notification.$COUNTER "${notification[@]}")
      fi
      while IFS=$'\t' read -r repo_url title url; do
        [ -z "$repo_url" ] && continue
        COUNTER=$((COUNTER + 1))
        owner_repo="${repo_url#*repos/}"
        notification=(
          label="$owner_repo: $title"
          icon="$GIT_PULL_REQUEST"
          icon.padding_left="0"
          label.padding_right="0"
          label.max_chars=80
          icon.color=$MAGENTA
          position=popup.github.bell
          icon.background.color=$MAGENTA
          drawing=on
          click_script="open $url; sketchybar --set github.bell popup.drawing=off"
        )
        args+=(--clone github.notification.$COUNTER github.template \
               --set github.notification.$COUNTER "${notification[@]}")
      done <<< "$DETAILS"
    fi
  done

  sketchybar -m "${args[@]}" > /dev/null

  if [ $COUNT -gt $PREV_COUNT ] 2>/dev/null || [ "$SENDER" = "forced" ]; then
    sketchybar --animate tanh 15 --set github.bell label.y_offset=5 label.y_offset=0
  fi
}

popup() {
  sketchybar --set "$NAME" popup.drawing="$1"
}

case "$SENDER" in
  "routine"|"forced") update
  ;;
  "mouse.entered") popup on
  ;;
  "mouse.exited"|"mouse.exited.global") popup off
  ;;
  "mouse.clicked") popup toggle
  ;;
esac
