#!/usr/bin/env bash
LOG_FILE="$(pwd)/logs/alerts.log"
. "$(dirname "$0")/lib.sh"

# Optional: Allow custom priority level from config or default to 'warning'
PRIORITY_LEVEL="${LOG_PRIORITY:-warning}"

log INFO "Starting log watcher with priority: $PRIORITY_LEVEL"

# Trap to handle script termination gracefully
trap 'log INFO "Log watcher stopped"; exit 0' SIGINT SIGTERM

# Start watching logs
journalctl -f -p "$PRIORITY_LEVEL" | while read -r line; do
  if echo "$line" | grep -Ei "failed|error|oom|killed"; then
    log ALERT "$line"

    # Optional: Wall notification
    if [ "$ENABLE_WALL" = true ]; then
      echo "$line" | wall
    fi

    # Optional: Email alert
    if [ "$ENABLE_MAIL" = true ]; then
      echo "$line" | mail -s "System Alert from Log Watcher" "$MAIL_TO"
    fi
  fi
done
