#!/bin/zsh

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

# sudo chmod g-w,o-w /usr/share/zsh
# sudo chmod g-w,o-w /usr/share/zsh/vendor-completions
# sudo chown root:root /usr/share/zsh
# sudo chown root:root /usr/share/zsh/vendor-completions

source ~/.zshrc
