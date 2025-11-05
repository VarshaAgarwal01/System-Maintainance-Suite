#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

. "$ROOT_DIR/etc/maint.conf"

mkdir -p "$LOG_DIR"

log() {
  printf '%s [%s] %s\n' "$(date -Is)" "$1" "$2" | tee -a "$LOG_FILE"
}
