#!/bin/bash

# Change to script's directory.
cd "$(dirname "$0")"

git pull origin master

./install.sh

