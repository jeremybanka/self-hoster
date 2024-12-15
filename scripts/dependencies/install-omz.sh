#!/bin/zsh

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

chmod g-w,o-w /usr/share/zsh
chmod g-w,o-w /usr/share/zsh/vendor-completions
chown root:root /usr/share/zsh
chown root:root /usr/share/zsh/vendor-completions

source ~/.zshrc
