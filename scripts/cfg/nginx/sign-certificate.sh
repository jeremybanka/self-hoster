#!/bin/zsh

sudo stow --adopt -t /etc/nginx scripts/cfg/nginx/etc/nginx
sudo git stash

sudo certbot --nginx -d tempest.games
sudo certbot --nginx -d realtime.tempest.games
sudo certbot --nginx -d flightdeck.tempest.games

sudo stow --adopt -t /etc/nginx critter/etc/nginx
git status
sudo git stash
