#!/bin/zsh

sudo stow --adopt -t / critter
stow --adopt -t ~ home

git status
git stash

source ~/.zshrc
