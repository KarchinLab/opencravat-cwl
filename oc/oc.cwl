#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
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
inputs:
  variants: File
  modules: Directory
  genome:
    type:
      type: enum
      symbols:
      - hg38
      - hg19
    default: hg38
arguments:
- $(inputs.variants.path)
- prefix: -l
  valueFrom: $(inputs.genome)
- prefix: -d
  valueFrom: '.'
- prefix: --endat
  valueFrom: postaggregator
- prefix: --system-option
  valueFrom: modules_dir=$(inputs.modules.path)
outputs:
  db:
    type: File
    outputBinding:
      glob: $(inputs.variants.basename).sqlite
  log:
    type: File
    outputBinding:
      glob: $(inputs.variants.basename).log
  err:
    type: File
    outputBinding:
      glob: $(inputs.variants.basename).err
