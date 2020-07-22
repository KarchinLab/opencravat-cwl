#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
  ShellCommandRequirement:
    class: ShellCommandRequirement
hints:
  DockerRequirement:
    #dockerImageId: ocrun
    dockerPull: karchinlab/opencravat:2.0.1
baseCommand: ['oc','run']
inputs:
  input:
    type: File
    inputBinding:
      position: 1
      shellQuote: false
  modulesDirectory:
    type: Directory
    inputBinding:
      prefix: '--system-option modules_dir='
      separate: false
      position: 2
      shellQuote: false
  genome:
    type: string
    inputBinding:
      prefix: -l
      position: 3
      shellQuote: false
    default: hg38
  outdir:
    type: string
    inputBinding:
      prefix: -d
      position: 4
      shellQuote: false
    default: .
  endat:
    type: string
    inputBinding:
      prefix: --endat
      position: 5
      shellQuote: false
    default: postaggregator

outputs:
  db:
    type: File
    outputBinding:
      glob: $(inputs.input.basename).sqlite
  log:
    type: File
    outputBinding:
      glob: $(inputs.input.basename).log
  err:
    type: File
    outputBinding:
      glob: $(inputs.input.basename).err
