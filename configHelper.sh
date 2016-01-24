#!/usr/bin/env bash

PWD=$(dirname "$0")

TARGETS=(
        ~/.vim/colors
        ~/.vimrc
        ~/.zshrc
        ~/.i3
        ~/.i3status.conf
        ~/.tmux.conf
        ~/.spacemacs
        ~/.taskrc
        ~/.vimperatorrc
        ~/.screenlayout
)

TARGETS_LEN=${#TARGETS[@]}

printHelp() {
        printf "usage: %s [-u update configs] [-d deply configs] [-l list configs]\n" "$0"
}
update() {
        echo "update settings..."

        for ((i = 0; i < TARGETS_LEN; i += 1)); do
                local src=${TARGETS[i]}
                local dest=$(echo "$src" | sed "s/\/home\/$USER/$PWD/g")

                #printf "copy from %s to %s\n" "$src" "$dest"
                if [[ -d "$src" ]]; then
                        printf "copy from %s/* to %s\n" "$src" "$dest"
                        mkdir -p $dest
                        cp -r "$src"/* "$dest"
                elif [[ -f "$src" ]]; then
                        printf "copy from %s to %s\n" "$src" "$dest"
                        cp -r "$src" "$dest"
                fi
        done

        echo "Done! Jolly good!!"
}

deploy() {
        echo "deploy settings..."

        for (( i = 0; i < TARGETS_LEN; i += 1)); do
                local dest=${TARGETS[i]}
                local src=$(echo "$dest" | sed "s/\/home\/$USER/$PWD/g")

                printf "copy from %s to %s\n" "$src" "$dest"
                cp -r "$src" "$dest"
        done

        echo "Done! Jolly good!!"
}

list() {
        for (( i = 0; i < TARGETS_LEN; i += 1)); do
                local src=${TARGETS[i]}
                local dest=$(echo "$src" | sed "s/\/home\/$USER/$PWD/g")

                printf "src: %20s\tdest: %20s\n" "$src" "$dest"
        done
}

if [ $# -eq 0 ]; then
        printHelp
        exit 0
fi

while getopts "dul" opt; do
        case $opt in
        d)
                deploy
                break
                ;;
        u)
                update
                break
                ;;
        l)
                list
                break
                ;;
        ?)
                printHelp
                break
                ;;
        esac
done
