#!/bin/bash 
DIR="$(cd "$(dirname "$0")" && pwd)"
pid=$1
timestamp=$2
sampling_time=$(date +%s)

readarray -t children < <(pgrep -P $pid)

if [ "${#children[*]}" -gt 0 ]; then
    python3 $DIR/children_data.py $sampling_time ${children[*]} >> profile_$timestamp.csv
fi