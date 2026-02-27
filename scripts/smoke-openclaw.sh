#!/usr/bin/env bash
set -euo pipefail

# Non-destructive smoke test for a real OpenClaw environment where the plugin is installed.
# Intended for release preflight and on-host validation.

openclaw memory-revised version
openclaw memory-revised stats
openclaw memory-revised list --limit 3
openclaw memory-revised search "plugin" --limit 3

# export/import (dry-run)
TMP_JSON="/tmp/memory-revised-export.json"
openclaw memory-revised export --scope global --category decision --output "$TMP_JSON"
openclaw memory-revised import --dry-run "$TMP_JSON"

# delete commands (dry-run/help only)
openclaw memory-revised delete --help >/dev/null
openclaw memory-revised delete-bulk --scope global --before 1900-01-01 --dry-run

# migrate (read-only)
openclaw memory-revised migrate check

# reembed (dry-run). Adjust source-db path if needed.
if [[ -d "$HOME/.openclaw/memory/lancedb-revised" ]]; then
  openclaw memory-revised reembed --source-db "$HOME/.openclaw/memory/lancedb-revised" --limit 1 --dry-run
else
  echo "NOTE: $HOME/.openclaw/memory/lancedb-revised not found; skipping reembed smoke."
fi

echo "OK: openclaw smoke suite passed"
