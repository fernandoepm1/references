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
