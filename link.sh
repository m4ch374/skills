#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
for d in skills/*/; do
  name="$(basename "$d")"
  for target in ~/.agents/skills ~/.claude/skills; do
    mkdir -p "$target"
    ln -sfn "$PWD/skills/$name" "$target/$name"
  done
  echo "linked $name"
done
