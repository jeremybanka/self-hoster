#!/bin/zsh

stow --adopt -t / critter
stow --adopt -t ~ home

git status
git diff
git stash

cat ~/.zshrc
cat ~/.gitconfig