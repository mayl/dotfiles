#!/usr/bin/env python3

import os

#print(os.getenv("HOME"))
print(os.name)

#Home directory is different on posix and nt
if os.name == "posix":
    HOME = os.getenv("HOME")
elif os.name == "nt":
    HOME = os.getenv("UserProfile")

print HOME
