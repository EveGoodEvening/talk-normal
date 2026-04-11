#!/usr/bin/env bash
# sync-skill.sh — copy prompt.md and install.sh from the repo root into skill/
# so the ClawHub skill bundle stays in sync with the source of truth.
#
# Run this before `clawhub skill publish ./skill`.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_DIR="$REPO_ROOT/skill"

if [ ! -d "$SKILL_DIR" ]; then
  echo "Error: $SKILL_DIR does not exist" >&2
  exit 1
fi

cp "$REPO_ROOT/prompt.md" "$SKILL_DIR/prompt.md"
cp "$REPO_ROOT/install.sh" "$SKILL_DIR/install.sh"
chmod +x "$SKILL_DIR/install.sh"

echo "Synced prompt.md and install.sh into $SKILL_DIR/"
echo "Next: clawhub skill publish ./skill --slug talk-normal --version X.Y.Z --tags latest"
