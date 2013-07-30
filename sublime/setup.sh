#!/bin/sh
# Setup a machine for Sublime Text 3
set -x

# symlink settings in
sublime_dir=~/.config/sublime-text-3/Packages
current_dir="${PWD}"
if [ "${PWD##*/}" != "sublime" ] && [ -d "sublime" ]
	then
	cd "sublime"
	current_dir="${PWD}"
fi

mv "$sublime_dir/User" "$sublime_dir/User.backup"
ln -s "$current_dir/User" "$sublime_dir"