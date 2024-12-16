#!/bin/zsh

FNM_ALREADY_INSTALLED=$(command -v fnm)

if [[ -z "$FNM_ALREADY_INSTALLED" ]]; then
  echo "🔧 install-fnm.sh: installing fnm"
  curl -fsSL https://fnm.vercel.app/install | SHELL=zsh bash
  source ~/.zshrc
else
  echo "🔧 install-fnm.sh: fnm already installed"
  curl -fsSL https://fnm.vercel.app/install --skip-shell | SHELL=zsh bash
fi

fnm use --install-if-missing