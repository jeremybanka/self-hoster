#!/bin/zsh

sudo stow --adopt -t $HOME home
sudo stow --adopt -t / critter

git status
sudo git stash