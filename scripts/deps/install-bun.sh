#!/bin/zsh

BUN_ALREADY_INSTALLED=$(command -v bun)

if [[ -z "$BUN_ALREADY_INSTALLED" ]]; then
  echo "🔧 install-bun.sh: installing bun"
  curl -fsSL https://bun.sh/install | SHELL=zsh bash
  source ~/.zshrc
  bun -v
  mkdir -p ~/.bun/install/global
else
  echo "🔧 install-bun.sh: bun already installed"
  bun upgrade
fi