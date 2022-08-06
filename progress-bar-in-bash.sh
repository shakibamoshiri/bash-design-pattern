#!/bin/bash

# link
# https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html

sleep 5 &
sleep_pid=$!;

echo PID: $sleep_pid;

# for index in {1..10}; do sleep 0.1; printf "\e[D#\e[C" ; done; echo
while [ -e /proc/$sleep_pid ]; do
    sleep 0.1; printf "\e[D#\e[C" ;
done
echo

echo PID: $sleep_pid done
