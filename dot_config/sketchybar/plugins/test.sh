#!/usr/bin/env bash

# This script is called by Sketchybar to update the current workspace name.
# It receives FOCUSED_WORKSPACE from the aerospace_workspace_change event.

LOG_FILE="/tmp/sketchybar_aerospace.log" # Or any other path you prefer

echo "--- $(date) ---" >>"$LOG_FILE"
echo "Script started." >>"$LOG_FILE"
echo "FOCUSED_WORKSPACE (from event): '$FOCUSED_WORKSPACE'" >>"$LOG_FILE"
echo "NAME (Sketchybar item name): '$NAME'" >>"$LOG_FILE"

# If FOCUSED_WORKSPACE is provided (from the event), use it.
# Otherwise, query AeroSpace directly (e.g., on initial load).
if [ -n "$FOCUSED_WORKSPACE" ]; then
  CURRENT_WORKSPACE="$FOCUSED_WORKSPACE"
  echo "Using FOCUSED_WORKSPACE: '$CURRENT_WORKSPACE'" >>"$LOG_FILE"
else
  echo "FOCUSED_WORKSPACE not set, querying AeroSpace..." >>"$LOG_FILE"
  CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)
  echo "Queried CURRENT_WORKSPACE: '$CURRENT_WORKSPACE'" >>"$LOG_FILE"
fi

sketchybar --set "$NAME" label="$CURRENT_WORKSPACE"
echo "Sketchybar command: sketchybar --set '$NAME' label='$CURRENT_WORKSPACE'" >>"$LOG_FILE"
echo "Script finished." >>"$LOG_FILE"
echo "" >>"$LOG_FILE"
