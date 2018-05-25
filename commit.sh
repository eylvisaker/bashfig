#!/bin/bash

# Change to script's directory.
cd "$(dirname "$0")"

cp ~/.bashrc bashrc
cp ~/.vimrc vimrc

git add bashrc vimrc
git add commit.sh install.sh pull.sh uninstall.sh

message=$1
if [[ -z $1 ]]; then
  $message="Adding configuration from `hostname` on `date`."
fi

git commit -m "$message"

git status

