#!/bin/zsh

source ~/.zshrc

sudo certbot --nginx -d tempest.games
sudo certbot --nginx -d realtime.tempest.games
sudo certbot --nginx -d flightdeck.tempest.games