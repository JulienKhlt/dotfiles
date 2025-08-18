#!/usr/bin/env bash

# This script is called by Sketchybar to update the current workspace name.
# It receives FOCUSED_WORKSPACE from the aerospace_workspace_change event.

# If FOCUSED_WORKSPACE is provided (from the event), use it.
# Otherwise, query AeroSpace directly (e.g., on initial load).
if [ -n "$FOCUSED_WORKSPACE" ]; then
  CURRENT_WORKSPACE="$FOCUSED_WORKSPACE"
else
  CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)
fi

sketchybar --set $NAME label="$CURRENT_WORKSPACE"
