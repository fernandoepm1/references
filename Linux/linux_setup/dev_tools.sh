#!/usr/bin/env bash

echo -------------
echo Installing go
echo -------------
echo

# Download linux-amd64 package
# From https://go.dev/doc/install
cd ~/ && wget https://go.dev/dl/go1.24.4.linux-amd64.tar.gz

# Remove any previous installation
sudo rm -rf /usr/local/go

# Extract the downloaded archive and install it to /usr/local
tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz

# Add go to PATH
echo -e '\nexport PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc

# Verify installation
go version

echo ---------------
echo Installing asdf
echo ---------------
echo

# Docs https://asdf-vm.com/guide/getting-started.html

# Installing with Go
# Default Go installation path is $HOME/go
go install github.com/asdf-vm/asdf/cmd/asdf@v0.18.0

# Set GOPATH and add asdf to PATH
cd ~ && mv go ~/.go
echo -e '\nGOPATH=$HOME/.go' >> ~/.zshrc
echo -e '\nexport PATH=$GOPATH/bin' >> ~/.zshrc

# Export asdf shims to PATH
echo -e 'export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"' >> ~/.zshrc

# Updating changes
source ~/.zshrc

echo ----------------------------
echo Installing ruby dependencies
echo ----------------------------
echo

# From https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
# Required for the latest stable builds
sudo apt-get install build-essential autoconf libssl-dev \
  libyaml-dev zlib1g-dev libffi-dev libgmp-dev rustc

# Required for old stable builds
sudo apt-get install patch libreadline6-dev libncurses5-dev libgdbm6 libgdbm-dev libdb-dev

echo ---------------
echo Installing ruby
echo ---------------
echo

# From https://github.com/asdf-vm/asdf-ruby
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

# Create default gems file
# This file is used to install gems automatically when a new Ruby version is installed
touch ~/.default-gems
echo -e "bundler" >> ~/.default-gems
echo -e "pry" >> ~/.default-gems
echo -e "solargraph" >> ~/.default-gems

# Install the latest stable Ruby version
asdf install ruby latest


echo ---------------
echo Installing node
echo ---------------
echo

# From https://github.com/asdf-vm/asdf-nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Create default npm packages file
# This file is used to install gems automatically when a new Ruby version is installed
touch ~/.default-npm-packages
echo -e "yarn" >> ~/.default-npm-packages
echo -e "express" >> ~/.default-npm-packages
echo -e "request" >> ~/.default-npm-packages
echo -e "lodash" >> ~/.default-npm-packages

asdf install nodejs latest

echo -----------------
echo Installing python
echo -----------------
echo

# Add the plugin for Python
asdf plugin add python https://github.com/asdf-community/asdf-python.git

# Dependencies for Python
sudo apt update
sudo apt install make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev curl git \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Create default python packages file
# This file is used to install packages automatically when a new Python version is installed
touch ~/.default-python-packages
echo -e "numpy" >> ~/.default-python-packages
echo -e "pandas" >> ~/.default-python-packages
echo -e "requests" >> ~/.default-python-packages

# Install the latest stable Ruby version
asdf install python latest


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
