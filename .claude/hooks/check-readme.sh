#!/bin/bash
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"
[ -z "$REPO_ROOT" ] && exit 0

README="$REPO_ROOT/README.md"
[ ! -f "$README" ] && exit 0

missing=""
for dir in "$REPO_ROOT"/*/; do
  if [ -f "$dir/.claude-plugin/plugin.json" ]; then
    plugin=$(basename "$dir")
    if ! grep -q "\[$plugin\]" "$README" 2>/dev/null; then
      missing="$missing $plugin"
    fi
  fi
done

if [ -n "$missing" ]; then
  echo "README.md に記載されていないプラグインがあります:$missing"
  echo "ルートの README.md を更新してください。"
fi
