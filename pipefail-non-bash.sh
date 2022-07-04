#!/bin/dash

################################################################################
# bash strict mode
################################################################################
set -T # inherit DEBUG and RETURN trap for functions
set -C # prevent file overwrite by > &> <>
set -E # inherit -e
set -e # exit immediately on errors
set -u # exit on not assigned variables
set -o pipefail # exit on pipe failure

filename=${1:?'firstname is needed'};

ls -la $filename  | { [  $? -eq 0 ] && grep -z shm; case $? in 0 ) echo done;; * ) echo error;; esac; }
