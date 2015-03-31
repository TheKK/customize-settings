#!/usr/bin/env sh

echo "Start update process..."

cp -r ~/.vim/colors ./
cp -r ~/.vimrc ./
cp -r ~/.zshrc ./
cp -r ~/.i3 ./
cp -r ~/.i3status.conf ./

git diff

echo "Done! Jolly good!!"
exit 0
