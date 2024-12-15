#!/bin/zsh

curl -fsSL https://bun.sh/install | bash
source ~/.zshrc
bun upgrade
for pkg in @antfu/ni diff-so-fancy; do
    bun install -g $pkg
done
