#!/bin/zsh

SHELL=/bin/zsh
echo "$(basename $SHELL)"
curl -fsSL https://bun.sh/install | zsh

ls -a $HOME/.bun
ls -a $HOME/.bun/bin
