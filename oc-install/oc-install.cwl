#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: CommandLineTool
baseCommand: oc-install-modules
requirements:
  DockerRequirement:
    dockerImageId: ocinstall
  NetworkAccess: 
    networkAccess: true
inputs:
  modules:
    type: string[]?
    inputBinding:
      position: 1
outputs:
  modulesDir:
    type: Directory
    outputBinding:
      glob: oc-modules
