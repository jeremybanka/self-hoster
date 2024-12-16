#!/bin/zsh

echo "🔧 setup.sh: source ~/.zshrc"
source ~/.zshrc

echo "🔧 setup.sh: ./scripts/deps/install-zsh.sh"
./scripts/deps/install-omz.sh
echo "🔧 setup.sh: ./scripts/deps/install-fnm.sh"
./scripts/deps/install-fnm.sh
echo "🔧 setup.sh: ./scripts/deps/install-bun.sh"
./scripts/deps/install-bun.sh
echo "🔧 setup.sh: ./scripts/deps/apt-install.sh"
./scripts/deps/apt-install.sh

echo "🔧 setup.sh: ./scripts/cfg/stow-adopt-stash.sh"
./scripts/cfg/stow-adopt-stash.sh

echo "🔧 setup.sh: source ~/.zshrc"
source ~/.zshrc

echo "🔧 setup.sh: installing global node_modules"
./scripts/deps/bun-globals.sh

echo "🔧 setup.sh: installing local node_modules"
ni
