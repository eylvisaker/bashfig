#!/bin/bash

# Change to script's directory.
cd "$(dirname "$0")"

git pull

./install.sh

