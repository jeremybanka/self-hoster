#!/bin/zsh

./scripts/deps/install-omz.sh
./scripts/deps/install-fnm.sh
./scripts/deps/install-bun.sh
./scripts/deps/apt-install.sh
./scripts/cfg/stow-adopt-stash.sh
./scripts/deps/globals.bun.ts
ni
