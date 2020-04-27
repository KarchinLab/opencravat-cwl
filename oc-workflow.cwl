#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  modules:
    type: File[]?
    inputBinding:
      position: 1
      prefix: --modules
  input:
    type: File?
    inputBinding:
      position: 3
outputs:
  db:
    type: File
    outputSource: oc/db
steps:
  oc:
    run: oc.cwl
    in:
      modules: modules
      input: input
    out: 
    - db 
