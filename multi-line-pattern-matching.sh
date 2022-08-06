#!/bin/bash

# bash strict mode
set -C
set -Ee
set -T
set -u
set -o pipefail

# answer for this stack-overflow question
# https://stackoverflow.com/questions/73042522/iterate-through-chunks-of-a-somewhat-structured-file-in-bash/73047195#73047195

file=$(<"$1");

declare -ir chunk_max=$(grep -c '^\-\-\-$'  <<< "$file");

for ((index=0; index < $chunk_max; ++index )); do
    chunk="${file%%$'\n'---*}";
    file="${file#*---$'\n'}";
    echo "chunk[ $index ]";
    echo "$chunk";
done

