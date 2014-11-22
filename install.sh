#!/bin/bash

files="bashrc screenrc tmux.conf vimrc"
dir=$(cd "$(dirname "$0")"; pwd)

for file in $files; do
    #backup files
    echo "mv ~/.$file $dir/$file.bak"
    mv ~/.$file $dir/$file.bak

    #create links
    echo "ln -s $dir/$file ~/.$file"
    ln -s $dir/$file ~/.$file
done
