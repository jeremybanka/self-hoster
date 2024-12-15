#!/bin/zsh

stow --adopt -t / critter
stow --adopt -t ~ home

git status
# git diff

echo "CREATED .zshrc"
cat ~/.zshrc

git stash

echo "REPO .zshrc"
cat ~/.zshrc

source ~/.zshrc

echo 'PATH=$PATH' >> ~/.zshrc

git diff

git d

g diff

g d