#!/bin/bash

files=($(find ./ -exec ls -d $PWD/{} \;))

for ((i = 1 ; i <= ${#files[@]} ; i++ )); do
    echo "$i"
    sleep 1 
done
