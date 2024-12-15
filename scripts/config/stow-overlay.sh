#!/bin/zsh

stow --adopt -t / critter
stow --adopt -t ~ home

git status
git stash

source ~/.zshrc
