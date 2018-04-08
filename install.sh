#!/bin/bash

# Change to script's directory.
cd "$(dirname "$0")"

if [ ! -f ~/.bashrc_system ]; then
    cp ~/.bashrc ~/.bashrc_system
fi

cp bashrc ~/.bashrc

cp ~/.vimrc ~/.vimrc.bak
cp vimrc ~/.vimrc

