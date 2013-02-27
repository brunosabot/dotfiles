[ -z "$PS1" ] && return

shopt -s checkwinsize
shopt -s histappend

umask 022

declare -x HISTCONTROL=ignoredups
declare -x HISTFILESIZE=100000
declare -x HISTSIZE=100000
declare -x HISTIGNORE=ls:ll:l:exit:cd:gs

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

if [ -f ~/shell/git_completion.sh]; then
	source ~/shell/git_completion.sh
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose"
git='$(__git_ps1 "[%s]")'

# VARIABLES PS1
RED='\033[1;31m'
BLUE='\033[1;34m'
WHITE='\033[1;37m'
NC='\033[m'

PS1RED='\[\033[1;31m\]'
PS1BLUE='\[\033[1;34m\]'
PS1WHITE='\[\033[1;37m\]'
PS1NC='\[\033[m\]'

if [ "$(id -u)" = "0" ]; then
	PS1="$PS1RED[$PS1WHITE\$(date \"+%H:%M\")$PS1RED]$PS1WHITE \u$PS1RED@$PS1WHITE\h$PS1RED:$PS1WHITE\w$PS1RED$git$PS1NC$ "
else
	PS1="$PS1BLUE[$PS1WHITE\$(date \"+%H:%M\")$PS1BLUE]$PS1WHITE \u$PS1BLUE@$PS1WHITE\h$PS1BLUE:$PS1WHITE\w$PS1BLUE$git$PS1NC$ "
fi

echo -e "$NC =============== $WHITE$HOSTNAME$NC ==============="
echo ""
echo -e "$NC Hello $WHITE$USER $NC!";
echo -e "$NC Today is:$WHITE	`date`";
if [ "$(id -u)" = "0" ]; then
	echo -e "$NC Load:$RED		`w | grep up | awk '{print $9" "$10" "$11}'`";
else
	echo -e "$NC Load:$BLUE		`w | grep up | awk '{print $9" "$10" "$11}'`";
fi
echo ""

