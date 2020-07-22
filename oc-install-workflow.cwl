#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  modules:
    type: string[]?
steps:
  oc-install:
    run: oc-install/oc-install.cwl
    in:
      modules: modules
    out: 
    - modulesDir
outputs:
  modulesDir:
    type: Directory
    outputSource: oc-install/modulesDir
