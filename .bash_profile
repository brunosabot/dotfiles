export GPG_TTY=$(tty)
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$PATH:$(yarn global bin)"
export PATH="/usr/local/sbin:$PATH"

. ~/.bashrc
