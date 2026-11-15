#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

TMUX_CONF_SRC="$DOTFILES_DIR/tmux/tmux.conf"

TMUX_CONF_DST="$HOME/.tmux.conf"

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak"
    echo "Backed up $target → ${target}.bak"
  fi
}

backup_if_exists "$TMUX_CONF_DST"

ln -sf "$TMUX_CONF_SRC" "$TMUX_CONF_DST"
echo "Linked $TMUX_CONF_DST → $TMUX_CONF_SRC"
