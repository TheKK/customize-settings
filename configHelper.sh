#!/usr/bin/env bash

PWD=$(pwd)

TARGETS=(
	~/.vim/colors $PWD
	~/.vimrc $PWD
	~/.zshrc $PWD
	~/.i3 $PWD
	~/.i3status.conf $PWD
	~/.tmux.conf $PWD
	~/.spacemacs $PWD
	~/.taskrc $PWD
	~/.vimperatorrc $PWD
)

TARGET_LEN=${#TARGETS[@]}

update()
{
	for (( i = 0; i < $TARGET_LEN; i += 2)); do
		local src=${TARGETS[i]}
		local dest=${TARGETS[i + 1]}

		cp -rv "$src" "$dest"
	done
}

deploy()
{
	for (( i = 0; i < $TARGET_LEN; i += 2)); do
		local src=${TARGETS[i + 1]}
		local dest=${TARGETS[i]}

		cp -rv "$src" "$dest"
	done
}

while getopts ":d:u" opt; do
	case $opt in
	d)
		echo "deploy settings..."
		deploy
		echo "Done! Jolly good!!"
		;;
	u)
		echo "update settings..."
		update
		echo "Done! Jolly good!!"
		;;
	?)
		echo "unknown command"
		;;
	:)
		echo "arguments needed"
	esac
done
