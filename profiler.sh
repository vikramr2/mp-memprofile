#!/bin/bash 
$@ > out.txt &
pid=$(pgrep -P $$)

trap "kill $pid 2> /dev/null" EXIT

while kill -0 $pid 2> /dev/null; do
    readarray -t children < <(pgrep -P $pid)
    if [ "${#children[*]}" -gt 0 ]; then
        for child in ${children[*]}; do
            echo $child
        done
    fi
    echo "---"
    sleep 1
done