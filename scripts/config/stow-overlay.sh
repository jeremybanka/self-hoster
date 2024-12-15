#!/bin/zsh

echo "adopting home as $(whoami) $HOME"
stow --adopt -t $HOME home
sudo echo "adopting critter as $(whoami) $HOME"
sudo stow --adopt -t / critter
echo "adopted critter as $(whoami) $HOME"

git status
git stash

source ~/.zshrc
