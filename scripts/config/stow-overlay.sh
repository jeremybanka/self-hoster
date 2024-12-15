#!/bin/zsh

echo "adopting home as $(whoami) $HOME"
stow --adopt -t ~ home
echo "adopting critter as root"
sudo stow --adopt -t / critter
echo "adopted critter as $(whoami) $HOME"

git status
git stash

source ~/.zshrc
