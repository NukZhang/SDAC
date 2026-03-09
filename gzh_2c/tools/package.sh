#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="${1:-SDAC-v1.1-claude-flow-pack.zip}"

echo "Packaging: $OUT"
cd "$ROOT"

# Exclude common noise
zip -r "$OUT" .   -x "*/node_modules/*"   -x "*/dist/*"   -x "*/build/*"   -x "*.DS_Store"   -x "*/.git/*"

echo "Done: $OUT"
