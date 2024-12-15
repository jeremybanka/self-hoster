#!/bin/zsh

curl -fsSL https://fnm.vercel.app/install | SHELL=zsh bash
echo 'PATH=$PATH:$HOME/.local/share/fnm' >> ~/.zshrc
echo 'eval "$(fnm env)"' >> ~/.zshrc
source ~/.zshrc
fnm use --install-if-missing