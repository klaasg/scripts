#!/bin/bash

for i in {5..1}
do
    echo -e "${i}\n"
    sleep 1
done

alfabet="ABCDEFGHIJKLAMOPQRSTUVWXYZ"
while [ 0 ]
do
    sleep ${1:-2}
    echo ${alfabet:$((${RANDOM}%26)):1}
done
