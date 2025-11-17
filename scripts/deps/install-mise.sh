#!/bin/zsh

arch="$(uname -m)"

case "$arch" in
    x86_64)
        ARCH="amd64"
        ;;
    aarch64|arm64)
        ARCH="arm64"
        ;;
    *)
        echo "Unknown architecture: $arch" >&2
        exit 1
        ;;
esac

MISE_ALREADY_INSTALLED=$(command -v mise)

if [[ -z "$MISE_ALREADY_INSTALLED" ]]; then
  echo "🔧 install-mise.sh: installing mise"
  sudo install -dm 755 /etc/apt/keyrings
  curl -fSs https://mise.jdx.dev/gpg-key.pub | sudo tee /etc/apt/keyrings/mise-archive-keyring.pub 1> /dev/null
  echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.pub arch=$ARCH] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
  sudo apt update
  sudo apt install -y mise
  mise trust
else
  echo "🔧 install-mise.sh: mise already installed"
fi

mise install