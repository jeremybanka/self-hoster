#!/bin/zsh

curl -fsSL https://bun.sh/install | SHELL=zsh bash
source ~/.zshrc
bun -v
mkdir -p ~/.bun/install/global
echo "{}" >> ~/.bun/install/global/package.json