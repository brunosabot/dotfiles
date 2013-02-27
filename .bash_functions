# Remove every deleted files in a git repository
function gitrm() {
	for i in `git status | grep deleted | awk '{print $3}'`; do git rm $i; done
}

# Retart nginx
function nginx() {
	sudo /etc/init.d/nginx restart
	sudo /etc/init.d/php5-fpm restart
}

# Extract every type of file
function extract() {
	if [ -f $1 ] ; then
		case $1 in
			*.7z) 7z x $1 ;;
			*.bz2) bunzip2 $1 ;;
			*.gz) gunzip $1 ;;
			*.rar) rar x $1 ;;
			*.tar) tar xvf $1 ;;
			*.tar.bz2) tar xvjf $1 ;;
			*.tar.gz) tar xvzf $1 ;;
			*.tar.bz2) tar xvjf $1 ;;
			*.tar.gz) tar xvzf $1 ;;
			*.tbz2) tar xvjf $1 ;;
			*.tgz) tar xvzf $1 ;;
			*.Z) uncompress $1 ;;
			*.zip) unzip $1 ;;
			*) echo "extraction impossible for '$1'..." ;;
		esac
	else
		echo "'$1' is not a file!"
	fi
}

# Searching in files with ack... excluding hidden directories
function search() {
	ack --follow -G ^[^.] $1
}

# Return a directory size
function dirsize () {
	du -shx * .[a-zA-Z0-9_]* 2> /dev/null
}

# Create a new directory and enter it
function mkcd() {
	mkdir -p "$@" && cd "$@"
}

# Count died process
function died() {
	top -b -n 1 | awk '{if (NR <=7) print; else if ($8 == "D") {print; count++} } END {print "Total status D: "count}'
}
