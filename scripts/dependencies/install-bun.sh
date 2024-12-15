#!/bin/zsh

echo "Installing Bun..."
curl -fsSL https://bun.sh/install | zsh
echo "Source ~/.zshrc..."
source ~/.zshrc
echo "Upgrading Bun..."
bun upgrade
echo "Installing global packages..."
global_packages="@antfu/ni diff-so-fancy"
for pkg in $global_packages; do
    bun install -g $pkg
done
echo "Adding ~/.bun/bin to PATH..."
export PATH="$HOME/.bun/bin:$PATH"
echo "Done!"