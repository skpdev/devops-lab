#!/usr/bin/env bash

# create_day.sh
# Usage: ./create_day.sh 6
#
# Creates a new day folder under month1/week1/dayN with
# empty notes.txt and summary.txt.

set -e

DAY_NUMBER="$1"

if [ -z "$DAY_NUMBER" ]; then
  echo "Usage: $0 <day-number>" >&2
  exit 1
fi

# This script lives in month1/week1/day5
# So ../.. from here is month1/week1
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DAY_DIR="$BASE_DIR/day${DAY_NUMBER}"

if [ -d "$DAY_DIR" ]; then
  echo "Day $DAY_NUMBER already exists at: $DAY_DIR"
  exit 0
fi

mkdir -p "$DAY_DIR"

# Create notes.txt
printf "Day %s notes:\n" "$DAY_NUMBER" > "$DAY_DIR/notes.txt"

# Create summary.txt
cat > "$DAY_DIR/summary.txt" <<EOF
Month 1 - Week 1 - Day $DAY_NUMBER

Today I:
-
EOF

echo "Created day $DAY_NUMBER structure at: $DAY_DIR"
