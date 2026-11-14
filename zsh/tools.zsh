# Initialization for various external tools.

command -v direnv >/dev/null && eval "$(direnv hook zsh)"
command -v fzf >/dev/null && source <(fzf --zsh)

# nvm is slow to load, so put the newest installed node on PATH and load nvm
# itself only on first use.
export NVM_DIR="$HOME/.nvm"
nvm_node=($NVM_DIR/versions/node/v*(N/nOn[1]))
[[ -n $nvm_node ]] && path=($nvm_node/bin $path)
unset nvm_node

nvm() {
  unfunction nvm
  local nvm_sh
  for nvm_sh in /opt/homebrew/opt/nvm/nvm.sh /usr/local/opt/nvm/nvm.sh; do
    [ -s "$nvm_sh" ] && \. "$nvm_sh" --no-use && break
  done
  nvm "$@"
}

if [ -x "$HOME/.jenv/bin/jenv" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# Same for rvm: use its saved default environment and load rvm on first use.
[[ -s "$HOME/.rvm/environments/default" ]] && source "$HOME/.rvm/environments/default"
path+="$HOME/.rvm/bin"
export PATH

rvm() {
  unfunction rvm
  source "$HOME/.rvm/scripts/rvm"
  rvm "$@"
}

# vim: et sw=2 sts=2
