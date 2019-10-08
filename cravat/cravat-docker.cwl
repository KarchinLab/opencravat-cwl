#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: cravat
hints:
  DockerRequirement:
    dockerImageId: oc-cwl
inputs:
  mdir:
    type: Directory
    inputBinding:
      position: 1
  input:
    type: File?
    inputBinding:
      position: 2 
  outdir:
    type: string
    inputBinding:
      position: 3
      prefix: -d
    default: .

outputs:
  db:
    type: File
    outputBinding:
      glob: $(inputs.input.basename).sqlite
