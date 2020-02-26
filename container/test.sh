#!/bin/bash

args=()
while [[ $# -ne 0 ]]; do
    if [[ $1 != -* ]]; then
        args+=($1)
        shift
    else
        break
    fi
done
echo ${args[*]}