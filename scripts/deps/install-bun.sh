#!/bin/zsh

curl -fsSL https://bun.sh/install | SHELL=zsh bash
source ~/.zshrc
bun -v
bun install --global diff-so-fancy
