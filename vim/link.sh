#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

VIMRC_SRC="$DOTFILES_DIR/vim/vimrc"

VIMRC_DST="$HOME/.vimrc"

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak"
    echo "Backed up $target → ${target}.bak"
  fi
}

# vimrc keeps swap files here
mkdir -p "$HOME/.vim/tmp"

backup_if_exists "$VIMRC_DST"

ln -sf "$VIMRC_SRC" "$VIMRC_DST"
echo "Linked $VIMRC_DST → $VIMRC_SRC"
