#!/usr/bin/env bash

echo ---------------------
echo Updating dependencies
echo ---------------------

sudo apt-get update && sudo apt upgrade

echo --------------
echo Installing zsh
echo --------------

sudo apt install zsh

echo ------------------------
echo Making zsh default shell
echo ------------------------

chsh -s $(which zsh)

echo ---------------------
echo Installing oh-my-zsh
echo ---------------------

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo ---------------------------
echo Installing oh-my-zsh themes
echo ---------------------------

# Powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# install powerlevel10k

echo ----------------------------
echo Installing oh-my-zsh plugins
echo ----------------------------

# install zsh-syntax-highlighting
# install zsh-auto-completion


# TODO

# install fonts
# configure git
# install chrome, spotify, zeal, vscode, insomnia

