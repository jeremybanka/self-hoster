#!/bin/bash

apt update && apt upgrade -y

apt install -y \
  certbot \
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
  zsh

curl -fsSL https://bun.sh/install

eval "$(fnm env)"
if [ -f .node-version ]; then
  fnm use
fi
bun upgrade
global_packages="@antfu/ni"
for pkg in $global_packages; do
    bun install -g $pkg
done
export PATH="$HOME/.bun/bin:$PATH"