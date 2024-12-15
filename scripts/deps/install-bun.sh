#!/bin/zsh

curl -fsSL https://bun.sh/install | bash
SHELL=/bin/zsh ~/.bun/bin/bun completions
