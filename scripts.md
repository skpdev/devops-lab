# Week 1 Utility Scripts

This document describes small Bash utilities created during Month 1, Week 1.

## check_disk_usage.sh (Day 6)

Location: `month1/week1/day6/check_disk_usage.sh`

Purpose:

- Check disk usage for the root filesystem (`/`).
- Accept an optional threshold argument (default 80).
- Exit with:
  - `0` if usage is below the threshold
  - `2` if usage is above the threshold
  - `1` for invalid input

Example usage:

```bash
./check_disk_usage.sh
./check_disk_usage.sh 90
