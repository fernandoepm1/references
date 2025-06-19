#!/usr/bin/env bash

echo --------------
echo Installing zsh
echo --------------
echo

sudo apt update
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

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Change settings
# code ~/.p10k.zsh
# p10k configure

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

# zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-history-substring-search \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# In WSL is giving permission issues,
# so add this line before source ~/.oh-my-zsh.sh
# ZSH_DISABLE_COMPFIX=true

echo -------------------------------------
echo Add oh-my-zsh plugins/theme to .zshrc
echo -------------------------------------
echo

nano ~/.zshrc
