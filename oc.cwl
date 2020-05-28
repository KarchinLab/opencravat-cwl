#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ocwrapper
hints:
  DockerRequirement:
    dockerPull: karchinlab/opencravat-cwl
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
  endat:
    type: string
    inputBinding:
      position: 6
      prefix: --endat
    default: postaggregator
outputs:
  db:
    type: File
    outputBinding:
      glob: $(inputs.input.basename).sqlite
