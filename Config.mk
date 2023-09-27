define add
    $(eval DOCKER_BUILD_ARGS += --build-arg $1=$$(TAG_$1))
    $(eval RUNTIMES += $1)
endef

# Final all runtimes image created by `make build`:
IMAGE_MAIN    := yaml-test-runtimes
TAG_MAIN      := 0.1.33

# Local Alpine builder base image:
# https://hub.docker.com/_/alpine?tab=tags
ALPINE	      := 3.18.3
TAG_ALPINE    := 0.0.5
FROM_ALPINE   := alpine:$(ALPINE)

# YAML testing runtime sources:

# XXX Try on latest alpine or newer MS one
# XXX Needs a bin/yaml-test-parse-dotnet
REPO_DOTNET   := https://github.com/aaubry/YamlDotNet
TAG_DOTNET    := 13.4.0
FROM_DOTNET   := mcr.microsoft.com/dotnet/core/sdk:3.1-alpine
$(call add,DOTNET)

# XXX Need to update this fork from the upstream
# XXX Needs a bin/yaml-test-parse-goyaml
REPO_GOYAML   := https://github.com/pantoniou/yaml
TAG_GOYAML    := 94c6e9d146b80adec76ceb99b393c2e1a796fd91
FROM_GOYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,GOYAML)

# XXX Try again on latest alpine
REPO_HSYAML   := https://github.com/haskell-hvr/HsYAML
TAG_HSYAML    := v0.2.1.1
FROM_HSYAML   := alpine:3.10.2
$(call add,HSYAML)

REPO_LIBFYAML := https://github.com/pantoniou/libfyaml
TAG_LIBFYAML  := v0.9
FROM_LIBFYAML := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,LIBFYAML)

REPO_LIBYAML  := https://github.com/yaml/libyaml
TAG_LIBYAML   := 0.2.5
FROM_LIBYAML  := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,LIBYAML)

REPO_LUAYAML  := https://github.com/gvvaughan/lyaml
TAG_LUAYAML   := 6.2.8
FROM_LUAYAML  := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,LUAYAML)

# XXX Try on latest alpine or newer nimlang version
# XXX Needs a bin/yaml-test-parse-nimyaml
REPO_NIMYAML  := https://github.com/flyx/NimYAML
TAG_NIMYAML   := 2.0.0
FROM_NIMYAML  := nimlang/nim:2.0.0-alpine
$(call add,NIMYAML)

REPO_NPMYAML  := https://github.com/eemeli/yaml
TAG_NPMYAML   := v2.3.2
FROM_NPMYAML  := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,NPMYAML)

# XXX Build from github source not cpan install
REPO_PPYAML   := https://github.com/perlpunk/YAML-PP-p5
TAG_PPYAML    := 0.036
FROM_PPYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,PPYAML)

# XXX Build from github source not pypi install
REPO_PYYAML   := https://github.com/yaml/pyyaml
TAG_PYYAML    := 6.0.1
FROM_PYYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,PYYAML)

REPO_RAPID    := https://github.com/biojppm/rapidyaml
TAG_RAPID     := 0.5.0
FROM_RAPID    := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,RAPID)

# XXX Try on latest alpine
REPO_REFHS    := https://github.com/orenbenkiki/yamlreference
TAG_REFHS     := bf471f804ccd014fcdded3a8c74c338df8f33c85
FROM_REFHS    := alpine:3.10.2
$(call add,REFHS)

REPO_REFPARSE := https://github.com/yaml/yaml-reference-parser
TAG_REFPARSE  := f00319457419feacddf743d75eb317dacf5caf4b
FROM_REFPARSE := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,REFPARSE)

REPO_RUAMEL   := https://github.com/pycontribs/ruamel-yaml
TAG_RUAMEL    := 0.17.32
FROM_RUAMEL   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,RUAMEL)

# XXX Needs a bin/yaml-test-parse-rustyaml
REPO_RUSTYAML := https://github.com/dtolnay/serde-yaml
TAG_RUSTYAML  := 0.9.25
FROM_RUSTYAML := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,RUSTYAML)

# XXX Latest version not working
REPO_SNAKE    := https://bitbucket.org/snakeyaml/snakeyaml
TAG_SNAKE     := snakeyaml-1.30
# TAG_SNAKE     := snakeyaml-2.2
FROM_SNAKE    := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,SNAKE)

# ************* NOT BUILDING 2023-09-26
# # XXX Latest version not working
# REPO_SNAKEENG := https://bitbucket.org/snakeyaml/snakeyaml-engine
# TAG_SNAKEENG  := 2.4-SNAPSHOT
# # TAG_SNAKEENG  := 2.7-SNAPSHOT
# FROM_SNAKEENG := yamlio/yaml-test-alpine:$(TAG_ALPINE)
# $(call add,SNAKEENG)

RUNTIMES := $(shell echo "$(RUNTIMES)" | tr A-Z a-z)
