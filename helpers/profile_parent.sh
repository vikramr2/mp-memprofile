#!/bin/bash 
pid=$1
timestamp=$2
sampling_time=$(date +%s)

python3 helpers/parent_data.py $sampling_time $pid >> profile_$timestamp.csv