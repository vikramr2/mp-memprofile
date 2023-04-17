#!/bin/bash 
pid=$1
timestamp=$2
readarray -t children < <(pgrep -P $pid)
sampling_time=$(date +%s)
if [ "${#children[*]}" -gt 0 ]; then
    python3 helpers/get_pid_data.py $sampling_time ${children[*]} >> profile_$timestamp.csv
fi