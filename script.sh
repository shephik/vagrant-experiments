#!/bin/bash

# Nodejs install
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=16
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt-get update
sudo apt-get install nodejs -y


# Postgres install
sudo apt install -y postgresql

sudo apt install -y make

# Settings for DB
sudo -u postgres psql -c "CREATE ROLE vagrant WITH LOGIN PASSWORD '1111';"
sudo -u postgres createdb vagrant


cd /vagrant/js-fastify-blog
make setup