#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zplug "so-fancy/diff-so-fancy", as:command, use:bin/git-dsf