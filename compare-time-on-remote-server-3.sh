#!/bin/bash

# host names
declare -a servers=(docker irj);
declare -A stat_time;

declare -r server=docker

mapfile -t files < <(ssh $server "find -maxdepth 1 -type f -printf '%T+@%p\n'");

OLDIFS=$IFS
IFS='@'
for file in "${files[@]}"; do
    # extra time and filename
    read _time _filename <<< "$file";

    printf "time: %s and filename: %s\n" $_time "$_filename";
done

echo

for file in "${files[@]}"; do
    # extra time and filename
    read _time _filename <<< "$file";

    # extract valid format for date --date
    _time=$(sed 's/+/ /' <<< $_time);

    # cover time to seconds
    _time=$(date --date $_time +%s);
    printf "time(seconds): %s and filename: %s\n" $_time "$_filename";
done
IFS=$OLDIFS

