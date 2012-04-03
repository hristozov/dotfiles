CCACHE_DIR="/var/tmp/ccache"
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

C_INCLUDE_PATH="/usr/include/libowfat/"

autoload -Uz compinit
compinit

autoload colors; colors
export PS1="%B%F{green}%n@%m%k %B%F{blue}%~ %# %b%f%k"
export PAGER="/usr/bin/most" #set in env.d
alias ls='ls --color=auto'
alias grep='grep --colour=auto'

alias emerge='sudo nice -n10 emerge'
alias emerge-upd='sudo nice -n20 emerge --keep-going -DuN world'
alias reboot='sudo reboot'
alias halt='sudo halt'
alias acpitool='sudo acpitool'
alias make='nice -n20 make -j4'
alias ccache='CCACHE_DIR=/var/tmp/ccache ccache'
alias wgc='wget -c'
alias fb='ssh -p2212 gh@forkbomb.nl'
alias straxil='ssh gogo@straxil.asteasolutions.net'
alias on='ssh-add -t 1800'
alias off='ssh-add -D'
alias l='ls -l'
alias la='ls -al'
alias v='vi'
alias s='sudo'
alias t='tmux'
alias ta='tmux attach'
alias revdep='sudo nice -n20 revdep-rebuild'
alias ctorrent='ctorrent -p 33222'
alias mem='sudo zsh -c "echo mem > /sys/power/state"'
alias disk='sudo zsh -c "echo disk > /sys/power/state"'

PATH="/opt/vmware/sbin/:/opt/vmware/lib/vmware/bin/:/opt/bin:/usr/games/bin:/usr/lib64/ccache/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:${PATH}"

setopt  autocd autopushd  pushdignoredups

#completion cache
zstyle ':completion::complete:*' use-cache 1

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

for k in ${(k)key} ; do
    # $terminfo[] entries are weird in ncurses application mode...
    [[ ${key[$k]} == $'\eO'* ]] && key[$k]=${key[$k]/O/[}
done
unset k

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

source /etc/profile.d/autojump.zsh

#eval $(gpg-agent --daemon)
#GPG_TTY=$(tty)
#export GPG_TTY

bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line

#[[ -s "/home/gh/.rvm/scripts/rvm" ]] && source "/home/gh/.rvm/scripts/rvm"  # This loads RVM into a shell session.

CCACHE_SLOPPINESS="time_macros"

/usr/bin/fortune
cd ~
