#!/bin/zsh

# shellcheck disable=SC2016
stow --adopt -t / critter
stow --adopt -t ~ home

git status
git diff
git stash