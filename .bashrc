[ -z "$PS1" ] && return

umask 022

declare -x HISTCONTROL=ignoredups
declare -x HISTFILESIZE=100000
declare -x HISTSIZE=100000
declare -x HISTIGNORE=ls:ll:l:exit:cd:gs

# VARIABLES PS1
PS1RED="\[\033[1;31m\]"
PS1GREEN="\[\033[1;32m\]"
PS1YELLOW="\[\033[1;33m\]"
PS1BLUE="\[\033[1;34m\]"
PS1MAGENTA="\[\033[1;35m\]"
PS1CYAN="\[\033[1;36m\]"
PS1WHITE="\[\033[1;37m\]"
PS1NC="\[\033[m\]"

PS1REDONWHITE="\[\033[1;31;47m\]"
PS1BLACKONWHITE="\[\033[1;30;47m\]"
PS1BLACKONBLUE="\[\033[1;30;44m\]"
PS1BLACKONYELLOW="\[\033[1;30;43m\]"
PS1BLUEONYELLOW="\[\033[1;34;43m\]"


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

if [ -f ~/shell/git-completion.zsh ]; then
	. ~/shell/git-completion.zsh
fi

if [ -f ~/shell/git-prompt.sh ]; then
	. ~/shell/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose"
git='$(__git_ps1 " %s ")'

FROWNY="$PS1RED ✘ "
SELECT="if [ \$? = 0 ]; then echo \"\"; else echo \"${FROWNY}\"; fi"
LOAD="`uptime 2> /dev/null | awk -F'load averages: ' '{ print $2 }'`"

PS1="\`${SELECT}\`$PS1WHITE[\$(date \"+%H:%M\")] $PS1BLUE\u@\h $PS1NC$PS1BLACKONBLUE \w $PS1BLACKONYELLOW$git$PS1NC $ "

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

# added by travis gem
[ -f /Users/pc/.travis/travis.sh ] && source /Users/pc/.travis/travis.sh
