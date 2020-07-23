#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
- class: ShellCommandRequirement
# Set TMPDIR to /tmp. If it's set automatically, when python's multiprocessing
# creates a socket in TMPDIR, the path will be too long for UNIX.
# Similar issue: https://github.com/broadinstitute/cromwell/issues/3647
- class: EnvVarRequirement
  envDef:
    TMPDIR: /tmp
hints:
- class: DockerRequirement
  dockerPull: karchinlab/opencravat
baseCommand: ['oc','run']
arguments:
- prefix: -d
  valueFrom: '.'
  shellQuote: false
- prefix: --endat
  valueFrom: postaggregator
  shellQuote: false
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
    type:
      type: enum
      symbols:
      - hg38
      - hg19
    inputBinding:
      prefix: -l
      position: 3
      shellQuote: false
    default: hg38

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
