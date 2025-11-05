#!/usr/bin/env bash
LOG_FILE="$(pwd)/logs/backup.log"
. "$(dirname "$0")/lib.sh"

if [ ! -d "$BACKUP_SRC" ]; then
  log ERROR "Backup source directory does not exist: $BACKUP_SRC"
  exit 1
fi

mkdir -p "$BACKUP_DEST"
ARCHIVE="$BACKUP_DEST/backup-$(date +%F-%H%M).tgz"

tar -czf "$ARCHIVE" "$BACKUP_SRC"
log INFO "Backup created: $ARCHIVE"
if [ "$ENABLE_WALL" = true ]; then
  wall "Backup completed: $ARCHIVE"
fi

if [ "$ENABLE_MAIL" = true ]; then
  echo "Backup completed: $ARCHIVE" | mail -s "Backup Notification" "$MAIL_TO"
fi


find "$BACKUP_DEST" -name "*.tgz" -mtime +$RETAIN_DAYS -delete
