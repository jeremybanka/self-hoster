#!/bin/bash

curl -fsSL https://bun.sh/install | bash
bun upgrade
global_packages="@antfu/ni"
for pkg in $global_packages; do
    bun install -g $pkg
done
export PATH="$HOME/.bun/bin:$PATH"