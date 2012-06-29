#!/usr/bin/env python

"""
addvimmodule [git repository] [folder name]

Adds a git repository as a submodule in the bundle directory.
"""

import sys
import os

repo = sys.argv[1]
foldername = sys.argv[2]

os.system('git submodule add ' + repo + ' vim/bundle/' + foldername)
