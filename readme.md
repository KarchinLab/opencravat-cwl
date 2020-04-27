# OpenCRAVAT CWL Tool

This container and cwl wrapper define a way to run OpenCRAVAT within CWL on platforms such as DNANexus and SevenBridges.
Modules are tarred and gzipped and passed as inputs to the cwl job. They are unzipped within the container before OpenCRAVAT runs.

## Building the container

Build the container at `container/Dockerfile`

## Packaging modules

OC-CWL module archives are a .tgz archive of an oc modules directory containing one or more modules. Before the job runs, the module archives are unzipped to create a combined mdir.

Some example module archives are temporarily available [here](https://files.kylemoad.com/public/occwl/modules)

## Running the tool

From the above link, place `base.tgz`, `clinvar.tgz`, and `go.tgz` into the `modules` directory, then run

```
cwl-runner oc.cwl job.cwl
```

## Running the workflow
From the above link, place `base.tgz`, `clinvar.tgz`, and `go.tgz` into the `modules` directory, then run

```
cwl-runner oc-workflow.cwl job.cwl
```

# Running without CWL

The container can be run without cwl as follows.

```
docker run -v $PWD:/tmp/job -v $PWD/modules:/tmp/modules oc oc --modules /tmp/modules/base.tgz /tmp/modules/clinvar.tgz /tmp/modules/go.tgz run /tmp/job/input.txt -l hg38
```
