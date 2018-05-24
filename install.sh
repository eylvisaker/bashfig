#!/bin/bash

# Change to script's directory.
cd "$(dirname "$0")"

mkdir -p ~/.bashfig/system

# Fix old version installation
if [ -f ~/.bashrc_system ]; then
  mv ~/.bashrc_system ~/.bashfig/system/.bashrc
fi

# Fresh installation
if [ ! -f ~/.bashfig/system/.bashrc ]; then
  mv ~/.bashrc ~/.bashfig/system/.bashrc

  if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.bashfig/system/.vimrc
  fi
fi

cp bashrc ~/.bashrc
cp vimrc ~/.vimrc

