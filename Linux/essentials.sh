#!/usr/bin/env bash

echo ---------------------
echo Updating dependencies
echo ---------------------
echo

sudo apt update && sudo apt upgrade

echo --------------
echo Installing git
echo --------------
echo

sudo apt install git

echo ---------------
echo Installing curl
echo ---------------
echo

sudo apt install curl

echo ---------------
echo Installing wget
echo ---------------
echo

sudo apt install wget

echo ---------------
echo Installing nano
echo ---------------
echo

sudo apt install nano

echo --------------------------
echo Setting up git credentials
echo --------------------------
echo

IFS= read -r -p "Enter your name: " name
git config --global user.name "$name"

IFS= read -r -p "Enter your email: " email
git config --global user.email "$email"

echo ---------------------
echo Git credentials added
echo ---------------------
echo

git config --list
