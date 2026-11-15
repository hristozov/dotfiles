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
zstyle ':vcs_info:git*+set-message:*' hooks git-ahead-behind
add-zsh-hook precmd vcs_info

# Append ↑ahead/↓behind counts relative to the upstream branch, if there is one.
function +vi-git-ahead-behind {
  local counts ahead behind
  counts=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null) || return 0
  read ahead behind <<< "$counts"
  (( ahead )) && hook_com[branch]+=" ↑$ahead"
  (( behind )) && hook_com[branch]+=" ↓$behind"
  return 0
}

PROMPT='$(prompt_string)'

# vim: et sw=2 sts=2 filetype=zsh
