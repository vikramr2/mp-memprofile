#!/bin/bash 
$@ > out.txt &
pid=$(pgrep -P $$)

trap "kill $pid 2> /dev/null" EXIT

while kill -0 $pid 2> /dev/null; do
    pgrep -P $pid
    echo "---"
    sleep 1
done