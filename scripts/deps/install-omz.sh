#!/bin/zsh

OMZ_ALREADY_INSTALLED=$(command -v omz)
echo "🔧 install-omz.sh: command -v omz: $OMZ_ALREADY_INSTALLED"
echo "🔧 install-omz.sh: which omz: $(which omz)"

if [[ -z "$OMZ_ALREADY_INSTALLED" ]]; then
  echo "🔧 install-omz.sh: installing omz"
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

  sudo chmod g-w,o-w /usr/share/zsh
  sudo chmod g-w,o-w /usr/share/zsh/vendor-completions
  sudo chown root:root /usr/share/zsh
  sudo chown root:root /usr/share/zsh/vendor-completions

  source ~/.zshrc
else
  echo "🔧 install-omz.sh: omz already installed"
  omz update
fi