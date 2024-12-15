#!/bin/bash

apt install -y \
  certbot \
  curl \
  ddclient \
  git \
  iptables \
  iptables-persistent \
  nginx \
  openssh-server \
  postgresql-common \
  python3-certbot-nginx \
  snort \
  stow \
  vim \
  zsh

/usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y
apt install -y postgresql-17
