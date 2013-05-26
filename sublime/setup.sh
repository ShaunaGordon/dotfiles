#!/bin/sh
# Setup a machine for Sublime Text 2
set -x

# symlink settings in
sublime_dir=~/.config/sublime-text-2/Packages
current_dir=`pwd`
mv "$sublime_dir/User" "$sublime_dir/User.backup"
ln -s "$current_dir/User" "$sublime_dir"