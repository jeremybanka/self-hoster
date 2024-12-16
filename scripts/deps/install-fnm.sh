#!/bin/zsh

curl -fsSL https://fnm.vercel.app/install | SHELL=zsh bash
source ~/.zshrc
fnm use --install-if-missing