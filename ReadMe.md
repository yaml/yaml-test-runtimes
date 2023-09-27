yaml-test-runtimes
==================

This repo produces a Docker image called `yamlio/yaml-test-runtimes`.

```
make build
```

It contains the following YAML parsing test programs and their supporting
runtime requirements:

* `yaml-test-parse-dotnet`   -- https://github.com/aaubry/YamlDotNet
* `yaml-test-parse-goyaml`   -- https://github.com/go-yaml/yaml
* `yaml-test-parse-hsyaml`   -- https://github.com/haskell-hvr/HsYAML
* `yaml-test-parse-libfyaml` -- https://github.com/pantoniou/libfyaml
* `yaml-test-parse-libyaml`  -- https://github.com/yaml/libyaml
* `yaml-test-parse-luayaml`  -- https://github.com/gvvaughan/lyaml
* `yaml-test-parse-nimyaml`  -- https://github.com/flyx/NimYAML
* `yaml-test-parse-npmyaml`  -- https://github.com/eemeli/yaml
* `yaml-test-parse-ppyaml`   -- https://github.com/perlpunk/YAML-PP-p5
* `yaml-test-parse-pyyaml`   -- https://github.com/yaml/pyyaml
* `yaml-test-parse-rapid`    -- https://github.com/biojppm/rapidyaml
* `yaml-test-parse-refhs`    -- https://github.com/orenbenkiki/yamlreference
* `yaml-test-parse-refparse` -- https://github.com/yaml/yaml-reference-parser
* `yaml-test-parse-ruamel`   -- https://github.com/pycontribs/ruamel-yaml
* `yaml-test-parse-rustyaml` -- https://github.com/dtolnay/serde-yaml
* `yaml-test-parse-snake`    -- https://bitbucket.org/snakeyaml/snakeyaml
* `yaml-test-parse-snakeeng` -- https://bitbucket.org/snakeyaml/snakeyaml-engine

## Making the Docker Image

The `make build` command will build each of the runtimes and combine them into
the final image.

The final Docker image is tagged `yamlio/yaml-test-runtimes:0.0.x` and is
pushed to hub.docker.com.
It is based on the latest `alpine` image with the necessary files copied in
from the other images.
It's currently around 400MB in size.

## Repository Layout

* `Makefile` -- Automates all the tasks.
* `Config.mk` -- All the runtime sources and version info is defined here.
* `docker/` -- Each runtime component is defined in a subdirectory of this.
  * `Makefile` -- This Makefile is used to build each runtime.
  * `main/` -- The Dockerfile for building the final image.
  * `alpine/` -- A base image Dockerfile used for many runtime builds.
  * `*/` -- There is one Dockerfile directory for each defined runtime.

## Used By

This image is used by the following projects:

* https://github.com/yaml/yaml-test-suite

  For getting test results while exporting to TSV.

* https://github.com/yaml/yaml-play

  For interactive testing against all supported parsers.

## Testing the Build

Running `make test` will build the Docker image and then run a container from
it and run a simple test program.
The tester calls each parser with the YAML input string `foo: bar`.
