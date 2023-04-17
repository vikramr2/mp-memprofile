#!/bin/bash 
sample_rate=1 # modify this to sample at different rates

timestamp=$(date +%s)
echo "pid,time,rss,pss,uss,shared,shared_file" > profile_$timestamp.csv

$@ &
pid=$(pgrep -P $$)

trap "kill $pid 2> /dev/null" EXIT

while kill -0 $pid 2> /dev/null; do
    ./helpers/profile_parent.sh $pid $timestamp &
    ./helpers/profile_children.sh $pid $timestamp &
    sleep $sample_rate
done