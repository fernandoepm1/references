#!/usr/bin/env bash

echo ---------------------
echo Updating dependencies
echo ---------------------
echo

sudo apt-get update && sudo apt upgrade

echo --------------
echo Installing zsh
echo --------------
echo

sudo apt install zsh

echo ------------------------
echo Making zsh default shell
echo ------------------------
echo

chsh -s $(which zsh)

echo ---------------------
echo Installing oh-my-zsh
echo ---------------------
echo

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo ---------------------------
echo Installing oh-my-zsh themes
echo ---------------------------
echo

# Powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# install powerlevel10k

echo ----------------------------
echo Installing oh-my-zsh plugins
echo ----------------------------
echo

# install zsh-syntax-highlighting
# install zsh-auto-completion

echo --------------------------
echo Setting up git credentials
echo --------------------------
echo

IFS= read -r -p "Enter your git username: " user_name
git config --global user.name "$user_name"

IFS= read -r -p "Enter your git email: " user_email
git config --global user.email "$user_email"

echo ---------------------
echo Git credentials added
echo ---------------------
echo

git config --list

# TODO

# install fonts
# configure git
# install chrome, spotify, zeal, vscode, insomnia

