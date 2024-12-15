#!/bin/zsh

SHELL="$(which zsh)" # install for zsh
curl -fsSL https://fnm.vercel.app/install | zsh
fnm use
