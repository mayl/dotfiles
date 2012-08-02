#!/usr/bin/env python3
#needs python3 for symlink support on windoze
"""
    link.py

    This is a program to detect the operating system and symlink the configuration
    'dotfiles' to the appropriate directory so they can be easily version controlled
"""

import os
import sys

print(os.name)
print(sys.platform)  # more detailed differentiator, may be needed later


#Home directory is different on posix and nt, get the appropriate one
if os.name == "posix":
    HOME = os.getenv("HOME")
elif os.name == "nt":
    HOME = os.getenv("UserProfile")

print(HOME)
print("Dont forget to run git submodule init, git submodule update")
