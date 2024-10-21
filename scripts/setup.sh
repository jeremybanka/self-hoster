#!/bin/bash

apt update

apt install -y ddclient
apt install -y fnm
apt install -y nginx
apt install -y postgresql-17

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