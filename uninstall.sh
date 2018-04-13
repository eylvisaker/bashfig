#!/bin/bash

mkdir -p ~/.bashfig/uninstall

mv ~/.bashrc ~/.bashfig/uninstall
mv ~/.vimrc ~/.bashfig/uninstall

cp ~/.bashfig/system/.bashrc ~/

if [ -f ~/.bashfig/system/.vimrc ]; then
  cp ~/.bashfig/system/.vimrc ~/
fi

rm -rf ~/.bashfig

