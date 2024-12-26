#!/bin/zsh

source ~/.zshrc

# Default to production
EXTRA_ARGS="--test-cert"

# If the first argument is --real, run Certbot for real
if [ "$1" = "--real" ]; then
  echo "Running Certbot for real..."
  EXTRA_ARGS=""
fi

sudo certbot --nginx $EXTRA_ARGS -d tempest.games
sudo certbot --nginx $EXTRA_ARGS -d realtime.tempest.games
sudo certbot --nginx $EXTRA_ARGS -d flightdeck.tempest.games
