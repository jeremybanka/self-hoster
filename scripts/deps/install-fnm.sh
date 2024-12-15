#!/bin/zsh

curl -fsSL https://fnm.vercel.app/install | bash
ls /root/.local/share
echo 'PATH=$PATH:/root/.local/share/fnm' >> ~/.zshrc
source ~/.zshrc
fnm use --install-if-missing