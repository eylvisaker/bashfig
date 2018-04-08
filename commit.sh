#!/bin/bash

# Change to script's directory.
cd "$(dirname "$0")"

cp ~/.bashrc bashrc
cp ~/.vimrc vimrc

git add bashrc vimrc
git add commit.sh install.sh pull.sh

git commit -m "Adding configuration from `hostname` on `date`."

git status

