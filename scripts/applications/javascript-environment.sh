#!/bin/bash

curl -fsSL https://fnm.vercel.app/install
eval "$(fnm env)"
if [ -f .node-version ]; then
  fnm use
fi

curl -fsSL https://bun.sh/install
bun upgrade
global_packages="@antfu/ni"
for pkg in $global_packages; do
    bun install -g $pkg
done
export PATH="$HOME/.bun/bin:$PATH"