#!/usr/bin/env python

from sh import git

dir = "~/dotfiles"
olddir = "~/dotfiles_old"

files = ["bashrc", "vimrc",  "vim", "Xresources", "/config/fish/config.fish"]

for word in files:
	print word


