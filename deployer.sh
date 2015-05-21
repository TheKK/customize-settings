#!/usr/bin/env sh

echo "Start deploy process..."

cp -rv ./colors ~/.vim
cp -rv ./.vimrc ~/
cp -rv ./.zshrc ~/
cp -rv ./.i3 ~/
cp -rv ./.i3status.conf ~/
cp -rv ./.tmux.conf ~

echo "Done! Jolly good!!"
