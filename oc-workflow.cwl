#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  modulesDirectory:
    type: Directory
    inputBinding:
      position: 1
  input:
    type: File
    inputBinding:
      position: 2
  genome:
    type: string
    inputBinding:
      position: 3
outputs:
  db:
    type: File
    outputSource: oc/db
  log:
    type: File
    outputSource: oc/log
  err:
    type: File
    oc/err
steps:
  oc:
    run: /oc/oc.cwl
    in:
      modulesDirectory: modulesDirectory
      input: input
    out: 
    - db
    - log
    - err 
