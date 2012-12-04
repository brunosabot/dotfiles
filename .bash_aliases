export LS_OPTIONS='--color=auto'
export HISTCONTROL=ignoredups

declare -x HISTCONTROL=ignoredups
declare -x HISTFILESIZE=100000
declare -x HISTSIZE=100000

# RACCOURCIS
alias cd='cd -P'
alias c="clear"
alias grep='grep $LS_OPTIONS'
alias it='iptables -nvx -L'
alias l='ls $LS_OPTIONS -lh'
alias ll='ls $LS_OPTIONS -alh'
alias ls='ls $LS_OPTIONS'
alias vi="vim"

# APT
alias ad='apt-get update'
alias ag='apt-get upgrade'
alias ai='apt-get install'

# FOLDERS
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# GIT
alias ga='git add .'
alias gc='git checkout'
alias gd='git diff'
alias gp='git pull origin master'
alias gs='git status -s -b'
alias gdmh='git diff master HEAD'
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`' # Go to git root

