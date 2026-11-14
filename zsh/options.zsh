# Shell options, history, completion and colors.

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt interactive_comments

setopt extended_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

autoload -U colors && colors

autoload -Uz compinit && compinit

# Homebrew's git ships a _git that wraps the bash completion and shadows zsh's
# own, which can't complete commits for e.g. `git commit --fixup`. compinit
# already registered the Homebrew one, so drop it before autoloading zsh's.
zsh_git=($^fpath/_git(N))
zsh_git=(${zsh_git:#*/site-functions/_git})
if (( $#zsh_git )); then
  unfunction _git 2>/dev/null
  autoload -Uz $zsh_git[1]
fi
unset zsh_git

zmodload -i zsh/complist
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' special-dirs true

export CLICOLOR=1

bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# vim: et sw=2 sts=2
