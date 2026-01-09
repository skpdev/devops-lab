#!/usr/bin/env bash

# check_disk_usage.sh
# Usage: ./check_disk_usage.sh [threshold]
#
# Checks root filesystem disk usage and prints a warning
# if usage is greater than the given threshold (default 80%).

set -e

THRESHOLD="${1:-80}"   # default to 80 if not provided

# Basic validation: THRESHOLD should be a number between 1 and 100
if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]] || [ "$THRESHOLD" -le 0 ] || [ "$THRESHOLD" -gt 100 ]; then
  echo "Usage: $0 [threshold]"
  echo "  threshold must be an integer between 1 and 100 (default 80)"
  exit 1
fi

# Get the usage percentage of the root filesystem (without the % sign)
USAGE=$(df -h / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

echo "Disk usage for / is ${USAGE}% (threshold: ${THRESHOLD}%)"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "WARNING: Disk usage is above threshold!"
  exit 2
else
  echo "OK: Disk usage is below threshold."
  exit 0
fi
