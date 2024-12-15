#!/bin/zsh

curl -fsSL https://fnm.vercel.app/install | zsh
source ~/.zshrc
fnm use --install-if-missing
