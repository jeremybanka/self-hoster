#!/bin/zsh

set -eo pipefail

curl -fsSL https://bun.sh/install | zsh
bun upgrade
global_packages="@antfu/ni diff-so-fancy"
for pkg in $global_packages; do
    bun install -g $pkg
done
export PATH="$HOME/.bun/bin:$PATH"