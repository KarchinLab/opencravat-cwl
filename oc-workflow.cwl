#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  variants: File
  modules: Directory
  genome:
    type:
      type: enum
      symbols:
      - hg38
      - hg19
steps:
  oc:
    run: oc/oc.cwl
    in:
      modules: modules
      variants: variants
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
