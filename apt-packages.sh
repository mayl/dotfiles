#!/usr/bin/env bash

cat packages/autoAptPackages.txt | xargs sudo apt install -y
