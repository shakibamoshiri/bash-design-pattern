#!/bin/bash

################################################################################
# bash strict mode
################################################################################
set -T # inherit DEBUG and RETURN trap for functions
set -C # prevent file overwrite by > &> <>
set -E # inherit -e
set -e # exit immediately on errors
set -u # exit on not assigned variables
set -o pipefail # exit on pipe failure


################################################################################
# if the regex pattern matches the text or not
################################################################################
function match(){
    {
        declare -r regex="$1";
        declare -r text="$2";
        declare result=''

        if [[ "$text" =~ "$regex" ]]; then
            result=true;
        else
            result=false
        fi
    } 1>&2

    echo "$result";
}

looking_for='are'
if [[ $(match $looking_for 'how you are today') == true ]]; then
    echo "[$looking_for] found";
else
    echo "[$looking_for] not found"
fi

looking_for='xxx'
if [[ $(match $looking_for 'how you are today') == true ]]; then
    echo "[$looking_for] found";
else
    echo "[$looking_for] not found"
fi
