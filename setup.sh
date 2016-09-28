#!/bin/bash 
#set -e makes the program exit when error happens
set -e

#set -x print out every single line it executes
set -x
 
#First find out if .tmux.conf exists under $HOME 

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
	echo "No tmux.conf file found!"
fi

echo "Now creating symbol link for .tmux.conf ......"
ln -s $current_dir/.tmux.conf ~/.tmux.conf
echo ".tmux.conf link created!"
