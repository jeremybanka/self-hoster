#!/bin/zsh

set -eo pipefail

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

echo "modifying zsh permissions"
chmod g-w,o-w /usr/share/zsh
chmod g-w,o-w /usr/share/zsh/vendor-completions
echo "modifying zsh ownership"
chown root:root /usr/share/zsh
chown root:root /usr/share/zsh/vendor-completions

echo "sourcing zsh"
source ~/.zshrc
