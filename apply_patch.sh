#!/bin/bash
set -eu

#lets format orginal pipeline file so we can easily dif later
./binary/fly format-pipeline -c input/pcf-pipelines.yml >> temp/pcf-pipelines-formatted.yml

# cat originalFile | yaml-patch patchFile.yml > resultYaml
cat input/pcf-pipelines.yml | ./binary/yaml-patch -o input/add-install-trigger.yml > temp/patched.yml

#yaml-patch screws up the formatting, fly format-pipeline will fix that
./binary/fly format-pipeline -c temp/patched.yml >> output/final-pipeline.yml
