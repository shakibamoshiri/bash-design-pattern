#!/bin/bash

set -eE
set -T
set -C
set -u
set -o pipefail


function f1(){
    trap 'printf "FAILED: %s\nEXIT_CODE: %d\nERROR_LINE: %d\n" "$cmd" $? $LINENO && echo _exit_with_error_' ERR;
    declare -a commands=( 'ls -la' 'xxx'  'df -h' 'lsblk' );

    for cmd in "${commands[@]}"; do
        printf "+ %s\n" "$cmd";
        eval "$cmd"
    done
    printf "\033";
}

# fails late
#result=$(f1);

# fails fast
#read -d $'\t' result < <(f1);

# it is better
mapfile -d $'\033'  -t  result < <(f1);

if [[ $result =~ _exit_with_error_ ]]; then
    printf "result: %s\n" "${result[*]}";
    exit 1;
else
    printf "result: %s\n" "${result[*]}";
fi


echo something else;
echo something else;
echo something else;
xxx
echo something else;
echo something else;
