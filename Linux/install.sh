#!/usr/bin/env bash

# Essentials
# git, curl and wget
sh linux_setup/essentials.sh

# Terminal Tweaks
# zsh and oh-my-zsh
sh linux_setup/terminal_tweaks.sh

# Databases
# postgres, pgAdmin4 and redis
sh linux_setup/databases.sh

# Dev Tools
# asdf, ruby, nodejs and yarn
sh linux_setup/dev_tools.sh

# Software
# chrome, vscode, spotify, zeal, insomnia 
sh linux_setup/software.sh


# TODO

# sh linux_setup/fonts.sh

# install fonts
sudo apt-get install fonts-powerline

# install .ttf fonts
