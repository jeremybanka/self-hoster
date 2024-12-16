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
echo "❓ who owns the global package.json"
ls -laL ~/.bun/install/global/package.json
./scripts/cfg/stow-adopt-stash.sh
echo "🔧 setup.sh: source ~/.zshrc"
source ~/.zshrc
echo "🔧 setup.sh: modifying ownership of global package.json"
GROUP=$(id -gn $USER)
echo "USER: $USER"
echo "GROUP: $GROUP"
sudo chown -R $USER:$GROUP ./home/.bun/install/global/package.json
sudo chmod 666 ./home/.bun/install/global/package.json
echo "🔧 setup.sh: installing global node_modules"
# bun install -gf
NPM_GLOBALS=$(jq -r '.dependencies | to_entries | map("\(.key)@\(.value)") | join(" ")' ~/.bun/install/global/package.json)
bun install --global $NPM_GLOBALS
echo "🔧 setup.sh: restricting ownership of global package.json"
sudo chmod 644 ./home/.bun/install/global/package.json
echo "❓ what's in ~/.bun"
ls -la ~/.bun
echo "---"
ls -laL ~/.bun
echo "❓ what's in ~/.bun/bin"
ls -la ~/.bun/bin
echo "---"
ls -laL ~/.bun/bin
echo "❓ what's in ~/.bun/install"
ls -la ~/.bun/install
echo "---"
ls -laL ~/.bun/install
echo "❓ what's in ~/.bun/install/global"
ls -la ~/.bun/install/global
echo "---"
ls -laL ~/.bun/install/global
echo "❓ who owns the global package.json"
ls -lal ~/.bun/install/global/package.json
echo "---"
ls -laL ~/.bun/install/global/package.json
echo "❓ what's in the global package.json"
cat ~/.bun/install/global/package.json
echo "❓ did the binaries perhaps get relative-placed?"
ls -la ./home/.bun
ls -la ./home/.bun/bin
echo "🔧 setup.sh: installing local node_modules"
ni
