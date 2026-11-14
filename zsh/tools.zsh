# Initialization for various external tools.

command -v direnv >/dev/null && eval "$(direnv hook zsh)"
command -v fzf >/dev/null && source <(fzf --zsh)

# Homebrew-provided nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"

if [ -x "$HOME/.jenv/bin/jenv" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
path+="$HOME/.rvm/bin"
export PATH

# vim: et sw=2 sts=2
