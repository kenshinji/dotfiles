#!/bin/bash 
#set -e makes the program exit when error happens
set -e

#set -x print out every single line it executes
set -x

#First chech whether Tmux is installed or not

command_exists() {
  command -v "$1" >/dev/null 2>&1;
}

if command_exists tmux; then
  current_dir="$( pwd )"
	if [ -f ~/.tmux.conf ]; then 
		if [ -L ~/.tmux.conf ]; then
			echo ".tmux.conf is a symbol link and now unlinking it...... "
			unlink ~/.tmux.conf
		else
			echo ".tmux.conf already exists, now backup it......"
			mv ~/.tmux.conf ~/.tmux.conf-`date +%Y%m%d`
		fi
	else
		echo "Tmux.conf file not found!"
	fi

	echo "Now creating symbol link for .tmux.conf ......"
	ln -s $current_dir/.tmux.conf ~/.tmux.conf
	echo ".tmux.conf link created!"
else
	#need to install tmux, depends on OS
	>&2 echo "Tmux not found, make sure you have installed it before continue."
	ret=1
	exit $ret
fi 




