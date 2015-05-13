#!/bin/sh

apt-get update
apt-get dist-upgrade
apt-get install -y apache2-utils
wget -qO- https://get.docker.com/ | sh
usermod -aG docker $1
docker pull registry:2.0
