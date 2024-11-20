#!/bin/bash

apt update && apt upgrade -y

apt install -y \
  certbot \
  curl \
  ddclient \
  fnm \
  git \
  iptables \
  iptables-persistent \
  nginx \
  openssh-server \
  postgresql \
  python3-certbot-nginx \
  snort \
  stow \
  vim \
  zsh

