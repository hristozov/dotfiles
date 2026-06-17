#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"

CONFIG_SRC="$DOTFILES_DIR/ghostty/config.ghostty"
BINDINGS_SRC="$DOTFILES_DIR/ghostty/custom-bindings.conf"

CONFIG_DST="$GHOSTTY_DIR/config.ghostty"
BINDINGS_DST="$GHOSTTY_DIR/custom-bindings.conf"

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak"
    echo "Backed up $target → ${target}.bak"
  fi
}

mkdir -p "$GHOSTTY_DIR"

[[ -f "$BINDINGS_SRC" ]] || touch "$BINDINGS_SRC"

backup_if_exists "$CONFIG_DST"
backup_if_exists "$BINDINGS_DST"

ln -sf "$CONFIG_SRC" "$CONFIG_DST"
echo "Linked $CONFIG_DST → $CONFIG_SRC"

ln -sf "$BINDINGS_SRC" "$BINDINGS_DST"
echo "Linked $BINDINGS_DST → $BINDINGS_SRC"
