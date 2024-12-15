#!/bin/zsh

stow --adopt -t / critter
stow --adopt -t ~ home

git status
# git diff
git stash

cat ~/.zshrc
cat ~/.gitconfig

source ~/.zshrc

echo 'PATH=$PATH" >> ~/.zshrc

git diff

git d

g diff

g d