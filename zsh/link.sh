#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

ZSHRC_SRC="$DOTFILES_DIR/zsh/zshrc"

ZSHRC_DST="$HOME/.zshrc"

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak"
    echo "Backed up $target → ${target}.bak"
  fi
}

backup_if_exists "$ZSHRC_DST"

ln -sf "$ZSHRC_SRC" "$ZSHRC_DST"
echo "Linked $ZSHRC_DST → $ZSHRC_SRC"
