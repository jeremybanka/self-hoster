#!/bin/zsh

set -eo pipefail

curl -fsSL https://fnm.vercel.app/install | zsh
source ~/.zshrc
fnm use --install-if-missing
