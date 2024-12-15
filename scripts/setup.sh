#!/bin/zsh

apt update && apt upgrade -y

./dependencies/shell.sh
./dependencies/apt-install.sh
./dependencies/javascript-environment.sh
