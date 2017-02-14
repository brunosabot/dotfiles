[ -z "$PS1" ] && return

shopt -s checkwinsize
shopt -s histappend

umask 022

declare -x HISTCONTROL=ignoredups
declare -x HISTFILESIZE=100000
declare -x HISTSIZE=100000
declare -x HISTIGNORE=ls:ll:l:exit:cd:gs

# VARIABLES PS1
RED='\033[1;31m'
BLUE='\033[1;34m'
PURPLE='\033[1;35'
WHITE='\033[1;37m'
NC='\033[m'

PS1RED='\[\033[1;31m\]'
PS1BLUE='\[\033[1;34m\]'
PS1PURPLE='\[\033[1;35m\]'
PS1WHITE='\[\033[1;37m\]'
PS1NC='\[\033[m\]'

if [ "$(id -u)" = "0" ]; then
	COLOR="$RED"
	PS1COLOR="$PS1RED"
else
	COLOR="$BLUE"
	PS1COLOR="$PS1BLUE"
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

if [ -f ~/shell/git-completion.bash ]; then
	. ~/shell/git-completion.bash
fi

if [ -f ~/shell/git-prompt.sh ]; then
	. ~/shell/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose"
git='$(__git_ps1 "[%s]")'

FROWNY="$PS1PURPLE:( $PS1NC"
SELECT="if [ \$? = 0 ]; then echo \"\"; else echo \"${FROWNY}\"; fi"
LOAD="`uptime 2> /dev/null | awk -F'load average: ' '{ print $2 }'`"

PS1="\`${SELECT}\`$PS1COLOR[$PS1WHITE\$(date \"+%H:%M\")$PS1COLOR]$PS1WHITE \u$PS1COLOR@$PS1WHITE\h$PS1COLOR:$PS1WHITE\w$PS1COLOR$git$PS1NC$ "

echo -e "$NC =============== $WHITE$HOSTNAME$NC ==============="
echo ""
echo -e "$NC Hello $WHITE$USER $NC!";
echo -e "$NC Today is:$WHITE	`date`";
if [ "$(id -u)" = "0" ]; then
	echo -e "$NC Load:$RED		$LOAD";
else
	echo -e "$NC Load:$BLUE		$LOAD";
fi
echo ""

# X Terminal titles
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD}\007"'
	;;
*)
	;;
esac
