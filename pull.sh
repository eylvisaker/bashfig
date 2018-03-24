#!/bin/bash

# Change to script's directory.
cd "$(dirname "$0")"

git pull

./install.sh

# if this script is run with source, then the updated bash profile will be loaded.
source ~/.bash_profile

