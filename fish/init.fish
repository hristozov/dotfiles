
set NTP_SERVER "bg.pool.ntp.org"

alias b='brew'
alias compress-bz2='tar --use-compress-program=pbzip2 -cvf'
alias compress-gz='tar -czvf'
alias compress-xz='tar --use-compress-program=pigz -cvf'
alias e='grep'
alias grep='grep --colour=auto'
alias h='ls -hl'
alias halt='sudo halt'
alias i='tig'
alias l='ls -l'
alias la='ls -al'
alias lh='ls -alh'
alias m='make'
alias n='npm'
alias ntp-diff="ntpdate -q $NTP_SERVER"
alias ntp-set="sudo ntpdate -u $NTP_SERVER"
alias nv='nvim'
alias p='ps aux'
alias reboot='sudo reboot'
alias rebuild-search-index='sudo mdutil -E /'
alias s='sudo'
alias serve-current-directory='python -m SimpleHTTPServer'
alias sv='sudo vim'
alias t='tmux -2'
alias ta='tmux -2 attach'
alias tat='tmux -2 attach -t'
alias tn='tmux new -s'
alias v='vim'
alias wgc='wget -c'
alias y='yarn'

alias g='git'
alias gap='git add -p'
alias gb-remove-merged='git branch --list | egrep "\s{2}merged" | xargs git branch -D'
alias gbd='git branch -D'
alias gcob='git checkout -b'
alias gcom='git checkout origin/master'
alias gdh='git diff head'
alias gdm='git diff master'
alias gdmh='git diff --stat master HEAD'
alias gdms='git diff --stat master'
alias gdo='git diff origin/(git_current_branch)'
alias gdot='git diff origin/(git_current_branch) --stat'
alias gds='git diff --staged'
alias gdsst='git diff --staged --stat'
alias gdst='git diff --stat'
alias gfu='git fetch upstream'
alias gh='git show'
alias git-ignore-file='git update-index --assume-unchanged'
alias git-list-biggest-objects="git rev-list --objects --all | grep \"\(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -10 | awk '{print\$1}')\""
alias git-list-ignored-files="git ls-files -v | grep '^[[:lower:]]'"
alias git-prune-origin='git remote update origin --prune'
alias git-prune-reflog='git reflog expire --expire=1.minute refs/heads/master && git fsck --unreachable && git prune && git gc'
alias git-set-default-branch='git symbolic-ref HEAD refs/heads/'
alias git-unignore-file='git update-index --no-assume-unchanged'
alias gmm='git merge master'
alias gms='git merge --squash'
alias gpo='git push origin'
alias gposu='git push --set-upstream origin (git_current_branch)'
alias gpt='git push --tags'
alias grbm='git rebase master'
alias grbb='git rebase -i master'
alias grbo='git rebase -i origin/(git_current_branch)'
alias grs='git reset --soft HEAD~1'
alias gsui='git submodule update --init'
alias gst='git status'
alias gd='git diff'
alias gc='git commit'
alias gb='git branch'
alias gt='git tag'
alias gtd='git tag -d'
alias ga='git add'
alias gp='git push'
alias gl='git pull'

abbr -a -- - 'cd -'

alias bubu='brew update && brew outdated && brew upgrade && brew cleanup'

source ~/.profile
