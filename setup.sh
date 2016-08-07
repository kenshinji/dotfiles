#!/bin/bash 
 
#First find out if .tmux.conf exists under $HOME 
if [ -f ~/.tmux.conf ]; then 
	echo "tmux.conf file found!"
else
	echo "no tmux.conf file found!"
fi

