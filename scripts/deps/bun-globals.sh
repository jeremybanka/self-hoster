#!/bin/zsh

GROUP=$(id -gn $USER)
GLOBAL_MANIFEST_PATH=./home/.bun/install/global/package.json
echo "🔧 bun-globals.sh: global manifest is $GLOBAL_MANIFEST_PATH"
echo "🔧 bun-globals.sh: global manifest contents:"
cat $GLOBAL_MANIFEST_PATH
echo "🔧 bun-globals.sh: giving ownership of global manifest to $USER:$GROUP; loosening write permissions"
sudo chown -R $USER:$GROUP $GLOBAL_MANIFEST_PATH
sudo chmod 666 $GLOBAL_MANIFEST_PATH
NPM_GLOBALS=$(jq -r '.dependencies | to_entries | map("\(.key)@\(.value)") | join(" ")' $GLOBAL_MANIFEST_PATH)
echo $NPM_GLOBALS | xargs bun install --global
echo "🔧 bun-globals.sh: restricting write permissions on global manifest"
sudo chmod 644 $GLOBAL_MANIFEST_PATH
