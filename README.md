# Dots, Dots, Everywhere

Like every super user in the *nix world, I've done a lot of customization to my dotfiles, those fun little configuration files that are hidden in Unix-like operating systems unless you know where to look.

I've put a lot of work into them, and have gotten tired of trying to manually keep track of it all, especially when I find that I've missed something on one of my other setups. So, I've finally decided to create a dotfile repository on GitHub, so that I can share my setup with the world.

## Requirements

Unlike just about every other dotfile repo I've found that's logically put together, I'm not a Mac user. I also don't use zsh for my shell, and even if I did, I didn't really want to rely on it for install/setup scripts (I prefer, rather, to have POSIX compliance as much as feasibly possible - or at least bash compatibility - so that I can run a script without worrying about whether X, Y, or Z is installed). That said, these scripts are written with Ubuntu in mind, so the locations of various settings that aren't universally in `~/` are written with Ubuntu/Fedora in mind (config files are generally stored in ~/.config unless the application otherwise specifies). If I ever toy around with Mac again, I'll probably update the script to include OS detection and adjust file locations as necessary. Until then, though, you'll have to edit the locations yourself.

Since this is hosted on GitHub, it is recommended that you have Git installed (and I suspect it may be a good idea to have all the other applications installed, too, so that you don't risk your customizations getting nuked, but that's just speculation), but `wget` or `curl` to the HTTP link to the repository should work just as well.

## Install

Run this:

```sh
git clone https://github.com/ShaunaGordon/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./boostraph.sh
```

## Organization! Synchronization!

Anyone that's done a lot of modifications to their dotfiles knows that they can get unruly very quickly, especially as you build your collection of languages, aliases, and who-knows-what else. This repo is my attempt at keeping things organized.

I'm also like a lot of other people in that I have more than one computer (home, work, auxillary...), and would like my settings consistent between them all, at least to start with. This greatly helps with that by keeping them all in one actual, physical location, while symlinking them where they all need to be. By keeping them all in one place and symlinking them around, it's a lot easier to keep track of them in a git repository.

### So What's In Here?

Not as much as a lot of other people, at least for right now. Now that I've set up a better way of versioning this stuff, it may very well end up growing significantly, but for now, I've kept it lean.

The main (and probably most reusable) things are going to be the bash, git, and nano sections, which set up sane defaults, and add some functionality to their respective tools. Git sets up command completion and the global gitconfig and gitignore files, and the bash and Nano folders set up output/syntax highlighting, short cuts, aliases, and some other things.

If you want to see what the others do, look through them. There's a bunch of different things, and keeping this updated with everything would make it just as unruly as the files this was meant to organize.

### How's It Work?

For the most part, it's all about the symlinks. The bootstrap comes across any `*.symlink` file, it symlinks it to the `~/` directory. One of the fun parts about this is that it's not limited to *files*. So you can also drop in a `*.symlink` directory and have the entire folder symlinked to `~/` (see the nano folder for this in action).

It will also find any `setup.sh` files and run them, which will handle special setups, such as symlinking SublimeText2's settings to where they need to go, or copying include files into the nginx directory.

## Thanks

Many, many thanks to GitHub's own [Zach Holman](https://github.com/holman/dotfiles) from whom I got the overall structure and the bootstrap file. Although I've forked it, I've pretty much changed everything, between nixing the zsh stuff, converting from Mac to Ubuntu locations, and just in general using different settings that didn't really overlap, so it probably can barely even be considered a fork anymore (really, the main purpose of forking it is so that it shows in the GitHub network graph and can more easily be traced back to him).

If you're a Mac and/or zsh user, I highly recommend checking out his dotfiles repo.