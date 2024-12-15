#!/bin/zsh

sudo stow --adopt -t / critter
sudo stow --adopt -t ~ home

git status
git stash

source ~/.zshrc
