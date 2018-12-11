#!/bin/bash

files="test_*.pl";

for file in $files; do
    echo "${file}"
    echo "----------------"
    swipl $file 
    echo
done
