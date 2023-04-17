#!/bin/bash 
timestamp=$(date +%s)
echo "pid,time,rss,pss,uss,shared,shared_file" > profile_$timestamp.csv

$@ &
pid=$(pgrep -P $$)

trap "kill $pid 2> /dev/null" EXIT

while kill -0 $pid 2> /dev/null; do
    readarray -t children < <(pgrep -P $pid)
    sampling_time=$(date +%s)
    if [ "${#children[*]}" -gt 0 ]; then
        python3 helpers/get_pid_data.py $sampling_time ${children[*]} >> profile_$timestamp.csv
    fi
    sleep 1
done