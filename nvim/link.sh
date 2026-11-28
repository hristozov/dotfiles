#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

NVIM_SRC="$DOTFILES_DIR/nvim"

NVIM_DST="$CONFIG_HOME/nvim"

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak"
    echo "Backed up $target → ${target}.bak"
  fi
}

mkdir -p "$CONFIG_HOME"

backup_if_exists "$NVIM_DST"

ln -sfn "$NVIM_SRC" "$NVIM_DST"
echo "Linked $NVIM_DST → $NVIM_SRC"

# Neovim only ships English; fetch the Bulgarian dictionary if missing
SPELL_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/spell"
BG_SPELL="$SPELL_DIR/bg.utf-8.spl"
if [[ ! -f "$BG_SPELL" ]]; then
  mkdir -p "$SPELL_DIR"
  curl -fsSL -o "$BG_SPELL" https://ftp.nluug.nl/pub/vim/runtime/spell/bg.utf-8.spl
  echo "Downloaded $BG_SPELL"
fi
