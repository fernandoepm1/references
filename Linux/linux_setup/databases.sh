#!/usr/bin/env bash

echo -------------------
echo Installing postgres
echo -------------------
echo

sudo apt update
sudo apt install libpq-dev postgresql postgresql-contrib

echo ----------------------
echo Creating postgres role
echo ----------------------
echo

sudo -u postgres createuser --interactive

# Setting postgres password
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"

# Switching to postgres prompt
# sudo -u postgres psql

echo -------------------
echo Installing pgadmin4
echo -------------------
echo

# Add GPG key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc \
	| sudo apt-key add -

# Add pgadmin repo
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" \
	| sudo tee  /etc/apt/sources.list.d/pgdg.list

# Install pgadmin4
sudo apt update
sudo apt install pgadmin4 pgadmin4-apache2

echo ----------------
echo Installing redis
echo ----------------
echo

sudo apt update
sudo apt install redis-server

echo ---------------------
echo Checking redis status
echo ---------------------
echo

sudo systemctl status redis-server
