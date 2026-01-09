#!/usr/bin/env bash

# backup_day_logs.sh
# Usage: ./backup_day_logs.sh [output-dir]
#
# Creates a tar.gz backup of the month1/week1 directory
# and stores it in the given output directory (default: ./backups).

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
SOURCE_DIR="$REPO_ROOT/month1/week1"

OUTPUT_DIR="${1:-$REPO_ROOT/backups}"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
ARCHIVE_NAME="week1_backup_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$OUTPUT_DIR/$ARCHIVE_NAME"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: source directory '$SOURCE_DIR' does not exist" >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

echo "Creating backup of $SOURCE_DIR"
echo "Output directory: $OUTPUT_DIR"
echo "Archive name: $ARCHIVE_NAME"

tar -czf "$ARCHIVE_PATH" -C "$REPO_ROOT" month1/week1

echo "Backup created at: $ARCHIVE_PATH"
