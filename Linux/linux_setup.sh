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

# In WSL is giving permission issues,
# so add this line before source ~/.oh-my-zsh.sh
# ZSH_DISABLE_COMPFIX=true

echo -------------------------------------
echo Add oh-my-zsh plugins/theme to .zshrc
echo -------------------------------------
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

echo ---------------
echo Installing asdf
echo ---------------
echo

# Docs https://asdf-vm.com/#/core-manage-asdf-vm
# From https://github.com/asdf-vm/asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8

# Adding to zsh/bash
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
# echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
# echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# Updating changes
source ~/.zshrc

echo ----------------------------
echo Installing ruby dependencies
echo ----------------------------
echo

# From https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
sudo apt-get install autoconf bison build-essential \
  libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
  libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev

echo ---------------
echo Installing ruby
echo ---------------
echo

# From https://github.com/asdf-vm/asdf-ruby
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

asdf install ruby 2.7.1 # latest
asdf global ruby 2.7.1
gem install bundler

echo ---------------
echo Installing node
echo ---------------
echo

# From https://github.com/asdf-vm/asdf-nodejs
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

asdf install nodejs 12.18.2 # LTS
asdf global nodejs 12.18.2

echo ---------------
echo Installing yarn
echo ---------------
echo

# From https://classic.yarnpkg.com/en/docs/install/#debian-stable
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn

echo -------------------
echo Installing zealdocs
echo -------------------
echo

sudo apt-get install zeal

echo -----------------
echo Installing chrome
echo -----------------
echo

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

echo -----------------
echo Installing vscode
echo -----------------
echo

# Dependencies
sudo apt update
sudo apt install software-properties-common apt-transport-https wget

# Importing Microsoft GPG key
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

# Enable vscode repo
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# Install vscode
sudo apt update && sudo apt install code








# TODO

# install fonts
sudo apt-get install fonts-powerline
# install spotify, insomnia
