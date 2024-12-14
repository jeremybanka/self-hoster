#!/bin/bash

apt update && apt upgrade -y

apt install -y \
  certbot \
  curl \
  ddclient \
  git \
  iptables \
  iptables-persistent \
  nginx \
  openssh-server \
  python3-certbot-nginx \
  snort \
  stow \
  vim \
  zsh

apt install -y postgresql-common
/usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
apt install -y postgresql-17