#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: python
hints:
  DockerRequirement:
    dockerImageId: 'python:3.6'
inputs:
  script:
    type: File
    inputBinding:
      position: 1
outputs:
  texts:
    type: File[]?
    outputBinding:
      glob: '*.txt'
