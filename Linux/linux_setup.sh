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
git clone https://github.com/bhilburn/powerlevel9k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# ~/.p10k.zsh

echo ----------------------------
echo Installing oh-my-zsh plugins
echo ----------------------------
echo

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# In WSL is giving permission issues, so add this line before source ~/.oh-my-zsh.sh
# ZSH_DISABLE_COMPFIX=true

echo -------------------------------
echo Add oh-my-zsh plugins to .zshrc
echo -------------------------------
echo

nano ~/.zshrc

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
sudo apt-get install fonts-powerline
# install asdf, ruby, node
# install chrome, spotify, zeal, vscode, insomnia

