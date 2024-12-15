#!/bin/bash
backup_dir="$HOME/stow-backups/$(date +%Y-%m-%d_%H-%M-%S)"
mkdir -p "$backup_dir"

# Move the conflicting file to the backup directory
mv "$1" "$backup_dir/"
