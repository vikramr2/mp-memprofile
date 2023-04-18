#!/bin/bash 
DIR="$(cd "$(dirname "$0")" && pwd)"

sample_rate=1 # modify this to sample at different rates

timestamp=$(date +%s)

outfile="profile_$timestamp"

echo "pid,time,rss,pss,uss,shared,shared_file" > $outfile.csv

$@ &
pid=$(pgrep -P $$)

trap "kill $pid 2> /dev/null" EXIT

while kill -0 $pid 2> /dev/null; do
    bash $DIR/helpers/profile_parent.sh $pid $timestamp &
    bash $DIR/helpers/profile_children.sh $pid $timestamp &
    sleep $sample_rate
done