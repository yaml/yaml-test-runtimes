yaml-test-runtimes
==================

This repo produces a Docker image called `yamlio/yaml-test-runtimes`.
It is based on `yamlio/yaml-editor` which is based on `yamlio/yaml-runtimes`.

It is used by the following projects:

* https://github.com/yaml/yaml-test-suite

  For getting test results while exporting to TSV.

* https://github.com/yaml/yaml-play

  For interactive testing against all supported parsers.

The repo contains testing code for some projects that don't yet support the
YAML Test Suite.
