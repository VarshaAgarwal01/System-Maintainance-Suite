#!/usr/bin/env bash

echo "---- System Maintenance Suite ----"
select opt in "Backup" "Update" "Start Log Watch" "Exit"; do
case $opt in
  "Backup") ./scripts/backup.sh ;;
  "Update") ./scripts/update.sh ;;
  "Start Log Watch") nohup ./scripts/logwatch.sh & ;;
  "Exit") exit ;;
esac
done
