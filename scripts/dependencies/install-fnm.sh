#!/bin/zsh

echo "$(basename "$SHELL")"

curl -fsSL https://fnm.vercel.app/install | zsh
fnm use
