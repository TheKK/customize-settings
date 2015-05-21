#!/usr/bin/env sh

echo "Start update process..."

cp -rv ~/.vim/colors ./
cp -rv ~/.vimrc ./
cp -rv ~/.zshrc ./
cp -rv ~/.i3 ./
cp -rv ~/.i3status.conf ./
cp -rv ~/.tmux.conf ./

git diff

echo "Done! Jolly good!!"
