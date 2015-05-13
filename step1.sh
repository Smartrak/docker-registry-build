#!/bin/sh

apt-get update
apt-get dist-upgrade
wget -qO- https://get.docker.com/ | sh
usermod -aG docker $1
docker pull registry:2.0
