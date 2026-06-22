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
* `yaml-test-parse-hsref`    -- https://github.com/orenbenkiki/yamlreference
* `yaml-test-parse-hsyaml`   -- https://github.com/haskell-hvr/HsYAML
* `yaml-test-parse-libfyaml` -- https://github.com/pantoniou/libfyaml
* `yaml-test-parse-libyaml`  -- https://github.com/yaml/libyaml
* `yaml-test-parse-nimyaml`  -- https://github.com/flyx/NimYAML
* `yaml-test-parse-npmyaml`  -- https://github.com/eemeli/yaml
* `yaml-test-parse-pyyaml`   -- https://github.com/yaml/pyyaml
* `yaml-test-parse-rapid`    -- https://github.com/biojppm/rapidyaml/
* `yaml-test-parse-ruamel`   -- https://pypi.org/project/ruamel.yaml/
* `yaml-test-parse-snake`    -- https://bitbucket.org/snakeyaml/snakeyaml
* `yaml-test-parse-yamlpp`   -- https://github.com/perlpunk/YAML-PP-p5
* `yaml-test-parse-yamlref`  -- https://github.com/yaml/yaml-reference-parser

## Making the Docker Image

The `make build` command will build each of the runtimes and combine them into
the final image.

The final Docker image is tagged `yamlio/yaml-test-runtimes:0.0.x` and is
pushed to hub.docker.com.
It is based on the latest `alpine` image with the necessary files copied in
from the other images.
It's currently around 400MB in size.

You can also build an image for an individual processor by going into
the folder of that processor under the [docker folder](./docker); for
example, to build rapidyaml the command is `make -C docker/rapid
build`.


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
