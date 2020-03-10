#!/bin/bash

pwd
echo $@

# Parse arguments
modules=()
mdir=
while [[ $# -gt 0 ]] && [[ $1 != 'run' ]]; do
    key=$1
    case $key in
        -m|--modules)
            posContainer='modules'
            shift
        ;;
        --modules-dir)
            mdir=$key
            preferMdir=true
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

# Locate/Set mdir, and expand modules if needed
if [ ! -z $mdir && ${#modules[@]} -ne 0 ]
then
    echo '--modules not allowed with --modules-dir'
    exit 1
elif [ ! -z $mdir ]
then
    realoc config md $mdir
elif [ ${#modules[@]} -ne 0 ]
then
    mdir=`realoc config md ./mdir`
    for module in "${modules[@]}"; do
        echo "Unzipping $module"
        tar -xzf $module -C $mdir
    done
fi
echo "mdir=$mdir"

# Set a shorter $TMPDIR so that python mp can
# create a socket there without name length
# issues.
echo "TMPDIR = $TMPDIR"
export TMPDIR=/tmp
echo "TMPDIR = $TMPDIR"

# Run OpenCRAVAT
realoc $@