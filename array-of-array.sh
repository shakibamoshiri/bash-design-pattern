#!/bin/bash


# bash strict mode
set -C
set -Ee
set -T
set -u
set -o pipefail

# global variable
declare -a arr=();

# get each line, by line number, starting from 0
function array_of_array(){
    # get the index
    declare -r index=${1:?'Error: first arg is needed'};

# each line is an array
# delimiter is comma ,
data="name surname 11, name surname 12, 123, 456
name surname 21, name surname 22, 123, 456, 789
name surname 31, name surname 32, 123, 456";

    # extract that line, start from 0
    mapfile -s $index  -t array <<< "$data";

    # delimiter is ,
    IFS=',';

    # remove space after comma
    array=${array//, /,}

    # save it in arr, a global variable
    read -a arr <<< "${array[0]}";
}


# read first line into an array
# read -a arr  <<< "$(array_of_array 0)"
array_of_array 0
echo
echo '### first ###'
echo arr: "${arr[0]}"
echo arr: "${arr[1]}"
echo arr: "${arr[2]}"
echo arr: "${arr[3]}"
echo size: "${#arr[@]}"


# read second line into an array
# read -a arr <<< "$(array_of_array 1)"
array_of_array 1
echo
echo '### second ###'
echo arr: "${arr[0]}"
echo arr: "${arr[1]}"
echo arr: "${arr[2]}"
echo arr: "${arr[3]}"
echo arr: "${arr[4]}"
echo size: "${#arr[@]}"
