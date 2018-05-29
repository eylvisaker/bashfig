#!/bin/bash

# Change to script's directory.
cd "$(dirname "$0")"

cp ~/.bashrc bashrc
cp ~/.vimrc vimrc

git add bashrc vimrc
git add commit.sh install.sh pull.sh uninstall.sh

message=$1
if [[ -z $1 ]]; then
  message="Adding configuration from `hostname` on `date`."
fi

staged=`git diff --name-only --cached 2> /dev/null | wc -l`

if [[ $staged -le 0 ]]; then
  echo "No changes to commit."
  exit 1
fi

git commit -m "$message"

git status

