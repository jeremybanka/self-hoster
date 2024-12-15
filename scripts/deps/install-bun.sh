#!/bin/zsh

curl -fsSL https://bun.sh/install | bash
export SHELL=/bin/zsh
eval "$(~/.bun/bin/bun completions)"
