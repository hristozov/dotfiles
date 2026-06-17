#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VSCODE_DIR="$HOME/Library/Application Support/Code/User"

SETTINGS_SRC="$DOTFILES_DIR/vscode/vscode-config.json"
KEYBINDINGS_SRC="$DOTFILES_DIR/vscode/vscode-keybindings.json"

SETTINGS_DST="$VSCODE_DIR/settings.json"
KEYBINDINGS_DST="$VSCODE_DIR/keybindings.json"

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak"
    echo "Backed up $target → ${target}.bak"
  fi
}

mkdir -p "$VSCODE_DIR"

backup_if_exists "$SETTINGS_DST"
backup_if_exists "$KEYBINDINGS_DST"

ln -sf "$SETTINGS_SRC" "$SETTINGS_DST"
echo "Linked $SETTINGS_DST → $SETTINGS_SRC"

ln -sf "$KEYBINDINGS_SRC" "$KEYBINDINGS_DST"
echo "Linked $KEYBINDINGS_DST → $KEYBINDINGS_SRC"
