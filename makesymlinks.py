#!/usr/bin/env python

from sh import git
from sh import mkdir
from sh import cd
from sh import ln

print "pulling git submodule content"
git("submodule", "init")
git("submodule", "update")

newdir = "/dotfiles"
olddir = "/dotfiles_old"

files = ["bashrc", "vimrc",  "vim", "Xresources", "/config/fish/config.fish", "/nvpy"]
folders = ["/config/fish, /fonts"]


print "Creating " + olddir + " for backup of any existing dotfiles..."
mkdir("-p", "$HOME"+olddir)
print "done"

print "Changing to " + newdir + "..."
cd("$HOME")
print "done"

print "copying backups of old files to <" + olddir + ">and symlinking new dotfiles in....\n"
for f in files:
	print f + "...",
	print "copied...",
	print "linked...",
	print " done"
	pass
