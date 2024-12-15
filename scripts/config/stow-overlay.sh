#!/bin/bash

# shellcheck disable=SC2016
stow -t / --override='sh ./scripts/config/stow_backup.sh $stow_target' critter
stow -t ~ --override='sh ./scripts/config/stow_backup.sh $stow_target' home
