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
echo "🔧 setup.sh: source ~/.zshrc"
source ~/.zshrc
echo "🔧 setup.sh: installing global node_modules"
./scripts/deps/globals.bun.ts
echo "❓ what's in ~/.bun"
ls -la ~/.bun
echo "❓ what's in ~/.bun/bin"
ls -la ~/.bun/bin
echo "❓ what's in ~/.bun/install"
ls -la ~/.bun/install
echo "❓ what's in ~/.bun/install/global"
ls -la ~/.bun/install/global
echo "🔧 setup.sh: installing local node_modules"
ni
