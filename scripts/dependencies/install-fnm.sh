#!/bin/bash

curl -fsSL https://fnm.vercel.app/install | bash
eval "$(fnm env)"
if [ -f .node-version ]; then
  fnm use
fi
