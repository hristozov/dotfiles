# forkbomb: inspired by the classic Gentoo shell prompt.

setopt prompt_subst

function prompt_char {
  if [ $UID -eq 0 ]; then echo "!"; else echo "$"; fi
}

prompt_string() {
  local hostname="%{$fg_bold[green]%}%m"
  local directory="%{$fg_bold[blue]%}%(!.%1~.%~)"
  local prompt_character="%{$fg_bold[blue]%} %_$(prompt_char)%{$reset_color%}"
  echo "$hostname $directory$prompt_character "
}

PROMPT='$(prompt_string)'

# vim: et sw=2 sts=2 filetype=zsh
