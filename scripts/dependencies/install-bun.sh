#!/bin/zsh

echo "Installing Bun..."
curl -fsSL https://bun.sh/install | bash
echo "Source ~/.zshrc..."
source ~/.zshrc
echo "Upgrading Bun..."
bun upgrade
echo "Installing global packages..."
for pkg in @antfu/ni diff-so-fancy; do
    bun install -g $pkg
done
echo "Adding ~/.bun/bin to PATH..."
export PATH="$HOME/.bun/bin:$PATH"
echo "Done!"