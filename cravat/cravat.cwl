#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: cravat
inputs:
  input:
    type: File?
    inputBinding:
      position: 1 
  outdir:
    type: string
    inputBinding:
      position: 2
      prefix: -d
    default: .

outputs:
  db:
    type: File
    outputBinding:
      glob: $(inputs.input.basename).sqlite
