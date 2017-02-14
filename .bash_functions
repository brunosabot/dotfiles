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

# get current host related info
function ii() {
	NETWORK="`/sbin/ifconfig | awk -F'inet addr:' '{ print $2 }' | awk '{print $1}' | tr -s ' ' '\n'`"

	echo -e "${COLOR}System infos:$NC " ; uname -a
	echo -e "\n${COLOR}Users logged on:$NC " ; w -sh
	echo -e "\n${COLOR}Current date:$NC " ; date
	echo -e "\n${COLOR}Machine stats:$NC " ; uptime
	echo -e "\n${COLOR}Memory stats:$NC " ; free -h
	echo -e -n "\n${COLOR}Network Information:$NC " ;
	echo -e "$NETWORK"

}

# 7 differencies game
function gitld() {
	git ld master...develop | grep -v "Merge branch" | grep -v "Merge remote"
}

# Leon, profession : Nettoyeur
function gitclean() {
	# optimize the repository
	git gc
	# remove references to deleted remote
	git remote update origin --prune
}

# Today I don't feel like doing anything
function gitpp() {

	if [ $# -eq 0 ]
	then
		git pull origin master
		git push origin master
	fi

	if [ $# -eq 1 ]
	then
		git pull origin $1
		git push origin $1
	fi

	git fetch

}
