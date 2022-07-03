#!/bin/bash

# bash strict mode
set -T # inherit DEBUG and RETURN trap for functions
set -C # prevent file overwrite by > &> <>
set -E # inherit -e
set -e # exit immediately on errors
set -u # exit on not assigned variables
set -o pipefail # exit on pipe failure

function get_array(){
    if (( ${#} == 0 )); then
        echo 'no arguments provided'
        exit 1;
    fi

    for arg in "${@}"; do
        echo "${arg} ${arg^^}";
    done
}

# test
echo 'call the function'
get_array how are you;

# not the right way
# array=($(get_array how are you));


echo
echo 'save the result in an array'
# right way
mapfile -t array < <(get_array how are you);

echo array size: ${#array[*]}
echo array[0]: ${array[0]}
echo array[1]: ${array[1]}
echo array[2]: ${array[2]}

echo
echo 'iterate over array with for loop'
for index in "${array[@]}"; do
    echo "index: $index";
done
