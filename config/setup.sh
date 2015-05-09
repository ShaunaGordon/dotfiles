#!/bin/sh
#
# bootstrap installs things.
# Grabbed from Holman's repository. This falls under the MIT license, see LICENSE-MIT for info

DOTFILES_ROOT="${PWD}"
OS="$(uname -s)"

set -e

echo ''

info () {
	printf " [ \033[00;34m..\033[0m ] $1"
}

user () {
	printf "\r [ \033[0;33m?\033[0m ] $1 "
}

success () {
	printf "\r\033[2K [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
	printf "\r\033[2K [\033[0;31mFAIL\033[0m] $1\n"
	echo ''
	exit
}

link_files () {
	ln -s $1 $2
	success "linked $1 to $2"
}

install_dotfiles () {
	info 'installing dotfiles'

	overwrite_all=false
	backup_all=false
	skip_all=false

	# Find and link all symlinks
	for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
	do
		dest="$HOME/.config/.`basename \"${source%.*}\"`"
		unlinkDest="$HOME/.`basename \"${source%.*}\"`"

		if [[ $OS == "Darwin" ]] && [[ -f "$source.darwin" ]]; then
			source="$source.darwin"
		fi

		if [ -f $dest ] || [ -d $dest ]
			then

			overwrite=false
			backup=false
			skip=false

			if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
				then
				user "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
				read -n 1 action

				case "$action" in
					o )
						overwrite=true;;
					O )
						overwrite_all=true;;
					b )
						backup=true;;
					B )
						backup_all=true;;
					s )
						skip=true;;
					S )
						skip_all=true;;
					* )
						;;
				esac
			fi

			if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
				then
				rm -rf $dest
				success "removed $dest"
			fi

			if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
				then
				mv $dest $dest\.backup
				success "moved $dest to $dest.backup"
			fi

			if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
				then
				link_files $source $dest
			else
				success "skipped $source"
			fi

		else
			link_files $source $dest
		fi

		# Remove the link that landed in ~/.home from the bootstrap script
		rm $unlinkDest
	done
}

install_dotfiles

echo ''
echo ' ~/.config/ files installed!'