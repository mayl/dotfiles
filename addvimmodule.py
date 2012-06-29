#!/usr/bin/python

"""
addvimmodule.py
	usage:
		./addvimmodule.py <git repo> <folder name>
clones the passed repo into a new directory of folder name as a submodule
"""

import sys
import os

os.system('git submodule add ' + sys.argv[1] + ' vim/bundle/' + sys.argv[2])
