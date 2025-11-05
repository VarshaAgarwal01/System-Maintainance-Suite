#!/usr/bin/env bash
LOG_FILE="$(pwd)/logs/update.log"
. "$(dirname "$0")/lib.sh"

if command -v apt-get &> /dev/null; then
  sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get autoremove -y
elif command -v dnf &> /dev/null; then
  sudo dnf -y upgrade && sudo dnf autoremove -y
fi

log INFO "System update completed"
