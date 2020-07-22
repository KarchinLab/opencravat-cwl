#!/bin/bash

oc config md oc-modules
oc module install-base

# Loop argv and install modules
for module
do
    echo installing $module
    oc module install -y $module
done