#!/bin/bash

alfabet="ABCDEFGHIJKLAMOPQRSTUVWXYZ"
while [ 0 ]
do
    sleep ${1:-2}
    echo ${alfabet:$((${RANDOM}%26)):1}
done
