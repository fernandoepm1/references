#!/usr/bin/env bash

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

# Install some essential gems
gem install bundler
gem install solargraph

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
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg \
  | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" \
  | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install yarn

echo ------------------------------
echo Installing docker dependencies
echo ------------------------------
echo

sudo apt install apt-transport-https ca-certificates \
  curl software-properties-common

echo -----------------
echo Installing docker
echo -----------------
echo

# Add GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo apt-key add -

# Add docker repo
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Install docker
sudo apt update
sudo apt install docker-ce

echo ----------------------
echo Checking docker status
echo ----------------------
echo

sudo systemctl status docker

echo ---------------------------
echo Adding user to docker group
echo ---------------------------
echo

# To avoid typing sudo every docker cmd
sudo usermod -aG docker ${USER}

# Applying changes
su - ${USER}

# Confirming changes
id -nG

#=> USER sudo docker
