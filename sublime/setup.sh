#!/bin/sh
# Setup a machine for Sublime Text 3
set -x

# symlink settings in
sublime_dir=~/.config/sublime-text-3/Packages
current_dir=`pwd`
mv "$sublime_dir/User" "$sublime_dir/User.backup"
ln -s "$current_dir/User" "$sublime_dir"