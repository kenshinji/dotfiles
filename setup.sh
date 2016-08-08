#!/bin/bash 
 
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
