#!/bin/bash

pwd
echo $@
modules=()
while [[ $# -gt 0 ]] && [[ $1 != 'run' ]]; do
    key=$1
    case $key in
        -m|--modules)
            posContainer='modules'
            shift
        ;;
        *)
            if [[ $1 != -* ]]; then
                eval "$posContainer+=($1)"
                shift
            else
                echo "Unknown option: $1" 1>&2
                exit 1
            fi
    esac
done
mdir=`realoc config md ./mdir`
echo "mdir = $mdir"
for module in "${modules[@]}"; do
    echo "Unzipping $module"
    tar -xzf $module -C $mdir
done
realoc $@
