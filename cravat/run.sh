#!/bin/bash

echo 'running oc'
echo $@
cravat-admin md $1
shift
cravat $@
