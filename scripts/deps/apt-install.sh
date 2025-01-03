#!/bin/zsh

sudo apt install -y \
  certbot \
  curl \
  ddclient \
  git \
  iptables \
  iptables-persistent \
  lnav \
  nginx \
  openssh-server \
  postgresql-common \
  python3-certbot-nginx \
  snort \
  stow \
  vim \
  zsh

sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y
sudo apt install -y postgresql-17
