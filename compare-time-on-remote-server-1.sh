#!/bin/bash


# SHH to host and stat a file
# declare -r HOST_1_TIME=$(ssh $HOST_1 "stat  /var/log/auth.log" | perl -lne '/Modify: \K[^\.]+/ && print $&');
# declare -r HOST_2_TIME=$(ssh $HOST_2 "stat  /var/log/auth.log" | perl -lne '/Modify: \K[^\.]+/ && print $&');

# convert the time to second
# declare -ir HOST_2_TIME_SECOND=$(date --date "$HOST_2_TIME" +%s)
# declare -ir HOST_1_TIME_SECOND=$(date --date "$HOST_1_TIME" +%s)


# host names
HOST_1=docker
HOST_2=irj

# SHH to host and stat a file
declare -ir HOST_1_TIME=$(ssh $HOST_1 "stat -c %Y /var/log/auth.log");
declare -ir HOST_2_TIME=$(ssh $HOST_2 "stat -c %Y /var/log/auth.log");

# print
echo HOST_1_TIME: $HOST_1_TIME
echo HOST_2_TIME: $HOST_2_TIME
echo diff: $(( $HOST_1_TIME - $HOST_2_TIME ));

# check which was access first
if (( $HOST_1_TIME < $HOST_2_TIME )); then
    echo "HOST_1: $HOST_1 logged in first"
else
    echo "HOST_2: $HOST_2 logged in first"
fi
