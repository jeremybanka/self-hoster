#!/bin/zsh

stow --adopt -t ~ home
sudo stow --adopt -t / critter

git status
git stash

source ~/.zshrc
