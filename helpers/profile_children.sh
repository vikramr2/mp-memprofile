#!/bin/bash 
pid=$1
timestamp=$2
sampling_time=$(date +%s)

readarray -t children < <(pgrep -P $pid)

if [ "${#children[*]}" -gt 0 ]; then
    python3 helpers/children_data.py $sampling_time ${children[*]} >> profile_$timestamp.csv
fi