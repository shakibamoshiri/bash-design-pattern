#!/bin/dash

filename=${1:?'firstname is needed'};

ls -la $filename  | { [  $? -eq 0 ] && grep -z shm; case $? in 0 ) echo done;; * ) echo error;; esac; }
