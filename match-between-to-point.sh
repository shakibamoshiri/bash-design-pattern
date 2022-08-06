#!/bin/bash

filename=$1;
match1=$2
match2=$3

# find the line numbers of matches
mapfile -t index < <(grep -hn -e $match1 -e $match2  $filename  | grep -o '^[[:digit:]]\+');

# subtract them to get the offset
declare -i grep_offset=$((index[1] - index[0]));

# no need to use ${} inside ((...)) operator 
# declare -i grep_offset=$((${index[1]} - ${index[0]}));

# decrease by one, to ignore second match
let --grep_offset

# match from first one up to $grep_offset , then tail it + ignoring first match
grep -A $grep_offset $match1 $filename | tail -n $grep_offset


# include the matches 
# perl -lne '$/=unset; /Location1.*Location2/gs &&  print $&' file.txt 


# exclude the matches
# perl -ne '$/=unset; /(?<=Location1\n).*(?=Location2)/gs && print $&' file.txt

