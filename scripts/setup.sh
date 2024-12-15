#!/bin/zsh

echo "🔧 setup.sh: installing omz"
./scripts/deps/install-omz.sh
echo "🔧 setup.sh: installing fnm"
./scripts/deps/install-fnm.sh
echo "🔧 setup.sh: installing bun"
./scripts/deps/install-bun.sh
echo "🔧 setup.sh: installing apt"
./scripts/deps/apt-install.sh
echo "🔧 setup.sh: applying configurations"
./scripts/cfg/stow-adopt-stash.sh
echo "🔧 setup.sh: installing global node_modules"
./scripts/deps/globals.bun.ts
echo "🔧 setup.sh: installing local node_modules"
ni
