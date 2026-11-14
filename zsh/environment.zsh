# Various environment variables.

export LANG="en_US.UTF-8"

if hash vim 2>/dev/null; then
  export EDITOR=`which vim`
elif hash vi 2>/dev/null; then
  export EDITOR=`which vi`
fi

if hash most 2>/dev/null; then
  export PAGER=`which most`
elif hash less 2>/dev/null; then
  export PAGER=`which less`
fi

# Do not use a pager for less than 1 page
export LESS="$LESS -FRXK"

export HISTFILE=~/.histfile
export HISTSIZE=50000
export SAVEHIST=50000

# vim: et sw=2 sts=2
