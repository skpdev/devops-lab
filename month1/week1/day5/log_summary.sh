#!/usr/bin/env bash

# log_summary.sh
# Usage: ./log_summary.sh /path/to/logfile
#
# Summarizes basic info about a log file:
# - total lines
# - number of INFO, WARN, and ERROR lines


set -e

LOGFILE="$1"

if [ -z "$LOGFILE" ]; then
  echo "Usage: $0 /path/to/logfile" >&2
  exit 1
fi

if [ ! -f "$LOGFILE" ]; then
  echo "Error: file '$LOGFILE' does not exist" >&2
  exit 1
fi

echo "Log summary for: $LOGFILE"
echo "-------------------------"

TOTAL_LINES=$(wc -l < "$LOGFILE" || echo 0)
INFO_LINES=$(grep -c "INFO" "$LOGFILE" || echo 0)
WARN_LINES=$(grep -c "WARN" "$LOGFILE" || echo 0)
ERROR_LINES=$(grep -c "ERROR" "$LOGFILE" || echo 0)

echo "Total lines : $TOTAL_LINES"
echo "INFO lines : $INFO_LINES"
echo "WARN lines : $WARN_LINES"
echo "ERROR lines : $ERROR_LINES"
