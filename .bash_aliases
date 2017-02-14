export LS_OPTIONS='-G'

# RACCOURCIS
alias cd='cd -P'
alias c="clear"
alias grep='grep --color=auto'
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

# Graphical UI
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
