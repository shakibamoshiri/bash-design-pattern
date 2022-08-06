#!/bin/bash

# host names
declare -a servers=(docker irj);
declare -A stat_time;

for server in ${servers[*]}; do
    stat_time[$server]=$(ssh $server "stat -c %Y /var/log/auth.log");
done

for server in ${servers[*]}; do
    printf "%-20s %s\n" stat_time[$server]: ${stat_time[$server]};
done


