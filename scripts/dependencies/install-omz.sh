#!/bin/zsh

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

sudo chmod g-w,o-w /usr/share/zsh
sudo chmod g-w,o-w /usr/share/zsh/vendor-completions
sudo chown root:root /usr/share/zsh
sudo chown root:root /usr/share/zsh/vendor-completions

source ~/.zshrc

cat ~/.zshrc

zplug "so-fancy/diff-so-fancy", as:command, use:bin/git-dsf