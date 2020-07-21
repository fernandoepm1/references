#!/usr/bin/env bash

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
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- \
  | sudo apt-key add -

# Enable vscode repo
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# Install vscode
sudo apt update
sudo apt install code

echo ------------------
echo Installing spotify
echo ------------------
echo

# Adding repo and key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"

# Install spotify-client
sudo apt update
sudo apt install spotify-client

echo ----------------
echo Installing slack
echo ----------------
echo

# Download slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb

# Install it
sudo apt install ./slack-desktop-*.deb

# Remove it
sudo rm slack-desktop-*.deb

echo -------------------
echo Installing zealdocs
echo -------------------
echo

sudo apt-get install zeal

echo -------------------
echo Installing insomnia
echo -------------------
echo

# Add to sources
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
  | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
  | sudo apt-key add -

# Refresh repository sources and install Insomnia
sudo apt-get update
sudo apt-get install insomnia
