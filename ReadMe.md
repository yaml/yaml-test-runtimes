yaml-test-runtimes
==================

This repo produces a Docker image called `yamlio/yaml-test-runtimes`.

```
make build
```

It contains the runtimes for the following YAML parsing test programs:

* c-libfyaml-event -- C (local)
* c-libyaml-event -- C (remote)
* dotnet-yamldotnet-event -- .NET (remote)
* go-yaml-test -- Go (local)
* hs-hsyaml-event -- Haskell (remote)
* hs-reference-yeast -- Haskell (remote)
* java-snakeyaml-event -- Java (remote)
* js-yaml-event -- NodeJS (local)
* nim-nimyaml-event -- Nim (remote)
* perl-pp-event -- Perl (local)
* py-pyyaml-event -- Python (local)
* py-ruamel-event -- Python (local)
* yaml-reference-parser -- Perl (local)

The runtimes marked "remote" are currently copied from the Docker image
`yamlio/yaml-editor`.

The local runtimes are built in separate images under the `docker/` directory.

The final Docker image is based on the latest `alpine` image with the necessary
files copied in from the other images.
The image is currently around 375MB in size.

This image is used by the following projects:

* https://github.com/yaml/yaml-test-suite

  For getting test results while exporting to TSV.

* https://github.com/yaml/yaml-play

  For interactive testing against all supported parsers.

# Testing the Build

Running `make shell` will build the Docker image and then start a Bash shell in
a container running the image.

From this Bash prompt, run `check-testers`.
It will try each parser with the input:
```
foo: bar
```

Run `exit` to leave the Docker Bash shell.
