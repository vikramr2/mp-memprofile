#!/bin/bash 
DIR="$(cd "$(dirname "$0")" && pwd)"
pid=$1
timestamp=$2
sampling_time=$(date +%s)

python3 $DIR/parent_data.py $sampling_time $pid >> profile_$timestamp.csv