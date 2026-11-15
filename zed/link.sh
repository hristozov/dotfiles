#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ZED_DIR="$HOME/.config/zed"

SETTINGS_SRC="$DOTFILES_DIR/zed/settings.json"
KEYMAP_SRC="$DOTFILES_DIR/zed/keymap.json"
SNIPPETS_SRC="$DOTFILES_DIR/zed/snippets"

SETTINGS_DST="$ZED_DIR/settings.json"
KEYMAP_DST="$ZED_DIR/keymap.json"
SNIPPETS_DST="$ZED_DIR/snippets"

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak"
    echo "Backed up $target → ${target}.bak"
  fi
}

mkdir -p "$ZED_DIR"

backup_if_exists "$SETTINGS_DST"
backup_if_exists "$KEYMAP_DST"
backup_if_exists "$SNIPPETS_DST"

ln -sf "$SETTINGS_SRC" "$SETTINGS_DST"
echo "Linked $SETTINGS_DST → $SETTINGS_SRC"

ln -sf "$KEYMAP_SRC" "$KEYMAP_DST"
echo "Linked $KEYMAP_DST → $KEYMAP_SRC"

ln -sfn "$SNIPPETS_SRC" "$SNIPPETS_DST"
echo "Linked $SNIPPETS_DST → $SNIPPETS_SRC"
