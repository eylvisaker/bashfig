Bashfig
=======

A colorful configuration for bash and vim, intended for dark background. I created this
because I find the default color scheme to somewhat difficult to read, especially on
Ubuntu on Windows Subsystem for Linux (dark blue directories on a black background?!)

Features
--------

* A high contrast configuration for a dark background.
* Case-insensitive tab completion
* When working with git, status of your working branch is shown.

To install:
````
git checkout https://github.com/eylvisaker/bashfig
cd ~/bashfig
./install.sh
source ~/.bashrc
````

To uninstall:
````
cd ~/bashfig
./uninstall.sh
rm -rf ~/bashfig
cd ~
````

Tips
----

If the terminal prompt looks weird because it's not handling UTF-8 characters correctly, try running `dpkg-reconfigure locales` to fix it.

