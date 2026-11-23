# Initialization for various external tools. Each one is skipped if it's not
# installed.

setup_direnv() {
  command -v direnv >/dev/null || return
  eval "$(direnv hook zsh)"
}

setup_fzf() {
  command -v fzf >/dev/null || return
  source <(fzf --zsh)
}

# nvm is slow to load, so put the newest installed node on PATH and load nvm
# itself only on first use.
setup_nvm() {
  local nvm_sh nvm_node
  for nvm_sh in /opt/homebrew/opt/nvm/nvm.sh /usr/local/opt/nvm/nvm.sh; do
    [[ -s $nvm_sh ]] && break
  done
  [[ -s $nvm_sh ]] || return

  export NVM_DIR="$HOME/.nvm"
  nvm_node=($NVM_DIR/versions/node/v*(N/nOn[1]))
  [[ -n $nvm_node ]] && path=($nvm_node/bin $path)

  eval "nvm() {
    unfunction nvm
    \\. ${(q)nvm_sh} --no-use
    nvm \"\$@\"
  }"
}

setup_jenv() {
  if [[ -x "$HOME/.jenv/bin/jenv" ]]; then
    path=("$HOME/.jenv/bin" $path)
  elif ! command -v jenv &>/dev/null; then
    return
  fi

  eval "$(jenv init -)"
}

# Rust toolchain installed by rustup
setup_cargo() {
  [[ -s "$HOME/.cargo/env" ]] || return
  . "$HOME/.cargo/env"
}

setup_pnpm() {
  [[ -d "$HOME/Library/pnpm" ]] || return
  export PNPM_HOME="$HOME/Library/pnpm"
  path=($PNPM_HOME $path)
}

# Same for rvm: use its saved default environment and load rvm on first use.
setup_rvm() {
  [[ -s "$HOME/.rvm/scripts/rvm" ]] || return
  [[ -s "$HOME/.rvm/environments/default" ]] && source "$HOME/.rvm/environments/default"
  path+="$HOME/.rvm/bin"

  rvm() {
    unfunction rvm
    source "$HOME/.rvm/scripts/rvm"
    rvm "$@"
  }
}

for tool in direnv fzf nvm jenv cargo pnpm rvm; do
  setup_$tool
  unfunction setup_$tool
done
unset tool

export PATH

# vim: et sw=2 sts=2
