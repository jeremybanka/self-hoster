#!/bin/zsh

GROUP=$(id -gn $USER)
GLOBAL_MANIFEST_PATH=./home/.bun/install/global/package.json
echo "USER: $USER"
echo "GROUP: $GROUP"
sudo chown -R $USER:$GROUP $GLOBAL_MANIFEST_PATH
sudo chmod 666 $GLOBAL_MANIFEST_PATH
NPM_GLOBALS=$(jq -r '.dependencies | to_entries | map("\(.key)@\(.value)") | join(" ")' $GLOBAL_MANIFEST_PATH)
echo $NPM_GLOBALS | xargs bun install --global
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