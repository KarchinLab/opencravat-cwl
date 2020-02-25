#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: oc
hints:
  DockerRequirement:
    dockerImageId: oc
inputs:
  modules:
    type: File[]?
    inputBinding:
      position: 1
      prefix: --modules
  subcommand:
    type: string
    inputBinding:
      position: 2
    default: run
  input:
    type: File?
    inputBinding:
      position: 3
  outdir:
    type: string
    inputBinding:
      position: 4
      prefix: -d
    default: .
  genome:
    type: string
    inputBinding:
      position: 5
      prefix: -l
    default: hg38
outputs:
  db:
    type: File
    outputBinding:
      glob: $(inputs.input.basename).sqlite
