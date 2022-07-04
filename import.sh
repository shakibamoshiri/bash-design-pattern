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
# import 1
################################################################################
function import1(){
    declare -r local command_name=$1;

    if ! which $command_name > /dev/null 2>&1; then
        echo $command_name not found.
        echo Make sure you have installed it.
        echo install $command_name from here:
        case $command_name in
            yq )
                echo 'https://github.com/mikefarah/yq';
            ;;
            perl | printf | echo | paste )
                echo 'your package manager, apt-get, yum, dnf, apk, etc';
            ;;
            * )
                echo 'your OS repository or search the Internet';
            ;;
        esac
        exit 1;
    fi
}

import1 yq
import1 perl
import1 printf
import1 echo
import1 paste


################################################################################
# import 2
################################################################################
function import2(){
    if [ $# == 0 ]; then
        echo 'no arguments provided';
        return 1;
    fi

    declare -a not_found=();
    declare  not_found_flag=false;

    for cmd in ${@}; do
        if ! which $cmd > /dev/null 2>&1; then
            not_found+=($cmd);
            not_found_flag=true;
        fi
    done

    if [[ $not_found_flag == true ]]; then
        for nf in ${not_found[@]}; do
            echo "'$nf' not found, please install it";
        done
        return 1;
    fi
}

import2 yq perl zzz printf paste echo yyy ls
