#!/bin/zsh

source ~/.zshrc

# Default to production
EXTRA_ARGS="--test-cert"

# If the first argument is --real, run Certbot for real
if [ "$1" = "--real" ]; then
  echo "Running Certbot for real..."
  EXTRA_ARGS=""
fi

sudo certbot --nginx \
  -d tempest.games \
  -d realtime.tempest.games \
  -d flightdeck.tempest.games \
  $EXTRA_ARGS \
  --email admin@tempest.games \
  --agree-tos \
  --non-interactive
