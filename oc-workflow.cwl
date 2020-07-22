#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  input:
    type: File
  genome:
    type:
      type: enum
      symbols:
      - hg38
      - hg19
  modulesDirectory:
    type: Directory
steps:
  oc:
    run: oc/oc.cwl
    in:
      modulesDirectory: modulesDirectory
      input: input
      genome: genome
    out: 
    - db
    - log
    - err 
outputs:
  db:
    type: File
    outputSource: oc/db
  log:
    type: File
    outputSource: oc/log
  err:
    type: File
    outputSource: oc/err
