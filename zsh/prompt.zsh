# forkbomb: inspired by the classic Gentoo shell prompt.

setopt prompt_subst

function prompt_char {
  if [ $UID -eq 0 ]; then echo "!"; else echo "$"; fi
}

prompt_string() {
  local hostname="%{$fg_bold[green]%}%m"
  local directory="%{$fg_bold[blue]%}%(!.%1~.%~)"
  local branch=""
  if [ -n "$vcs_info_msg_0_" ]; then
    branch=" %{$fg_bold[yellow]%}<$vcs_info_msg_0_>"
  fi
  local prompt_character="%{$fg_bold[blue]%} %_$(prompt_char)%{$reset_color%}"
  echo "$hostname $directory$branch$prompt_character "
}

# Current git branch, shown between the directory and the prompt character.
autoload -Uz vcs_info add-zsh-hook
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:git:*' actionformats '%b|%a'
add-zsh-hook precmd vcs_info

PROMPT='$(prompt_string)'

# vim: et sw=2 sts=2 filetype=zsh
