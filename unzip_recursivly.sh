#!/bin/bash

# bash strict mode
set -C
set -Ee
set -T
set -u
set -o pipefail


# find them
mapfile -t zips < <(find -name \*.zip)

# unzip them
for zip in "${zips[@]}"; do unzip "$zip" -d "${zip%/*}"; done
