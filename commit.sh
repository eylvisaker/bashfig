#!/bin/bash

# Change to script's directory.
cd "$(dirname "$0")"

cp ~/.bash_profile bash_profile
cp ~/.vimrc vimrc

git add bash_profile vimrc

git commit -m "Adding configuration from `hostname` on `date`."

