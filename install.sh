#!/bin/bash

files="bashrc tmux.conf vimrc"
dir=$(cd "$(dirname "$0")"; pwd)

for file in $files; do
    #backup files
    if [ -f ~/.$file ]; then
        echo "Moving .$file from ~/ to $dir/bak"
        mv ~/.$file $dir/bak/$file.bak
    fi

    #create links
    echo "Creating symlink to $dir/$file in ~/"
    ln -s $dir/$file ~/.$file
done
