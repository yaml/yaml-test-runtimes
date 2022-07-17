define add
    $(eval DOCKER_BUILD_ARGS += --build-arg $1=$$(TAG_$1))
    $(eval RUNTIMES += $1)
endef

# Final all runtimes image created by `make build`:
IMAGE_MAIN    := yaml-test-runtimes
TAG_MAIN      := 0.1.32

# Local Alpine builder base image:
# https://hub.docker.com/_/alpine?tab=tags
ALPINE	      := 3.15.0
TAG_ALPINE    := 0.0.4
FROM_ALPINE   := alpine:$(ALPINE)

# YAML testing runtime sources:

REPO_REFPARSE := https://github.com/yaml/yaml-reference-parser
TAG_REFPARSE  := f00319457419feacddf743d75eb317dacf5caf4b
FROM_REFPARSE := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,REFPARSE)

REPO_REFHS    := https://github.com/orenbenkiki/yamlreference
TAG_REFHS     := bf471f804ccd014fcdded3a8c74c338df8f33c85
FROM_REFHS    := alpine:3.10.2
$(call add,REFHS)

REPO_DOTNET   := https://github.com/aaubry/YamlDotNet
TAG_DOTNET    := 11.2.1
FROM_DOTNET   := mcr.microsoft.com/dotnet/core/sdk:3.1-alpine
$(call add,DOTNET)

REPO_GOYAML   := https://github.com/pantoniou/yaml
TAG_GOYAML    := 94c6e9d146b80adec76ceb99b393c2e1a796fd91
FROM_GOYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,GOYAML)

REPO_HSYAML   := https://github.com/haskell-hvr/HsYAML
TAG_HSYAML    := v0.2.1.1
FROM_HSYAML   := alpine:3.10.2
$(call add,HSYAML)

REPO_LIBFYAML := https://github.com/pantoniou/libfyaml
TAG_LIBFYAML  := v0.7.12
FROM_LIBFYAML := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,LIBFYAML)

REPO_LIBYAML  := https://github.com/yaml/libyaml
TAG_LIBYAML   := 0.2.5
FROM_LIBYAML  := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,LIBYAML)

REPO_LUAYAML  := https://github.com/gvvaughan/lyaml
TAG_LUAYAML   := 6.2.7
FROM_LUAYAML  := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,LUAYAML)

REPO_NIMYAML  := https://github.com/flyx/NimYAML
TAG_NIMYAML   := 1.0.0
FROM_NIMYAML  := nimlang/nim:1.6.0-alpine
$(call add,NIMYAML)

REPO_NPMYAML  := https://github.com/eemeli/yaml
TAG_NPMYAML   := v2.1.1
FROM_NPMYAML  := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,NPMYAML)

# https://metacpan.org/pod/YAML::PP
TAG_PPYAML    := 0.034
FROM_PPYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,PPYAML)

# https://pypi.org/project/PyYAML/
TAG_PYYAML    := 6.0
FROM_PYYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,PYYAML)

REPO_RAPID    := https://github.com/biojppm/rapidyaml
TAG_RAPID     := 0.4.1
FROM_RAPID    := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,RAPID)

# https://pypi.org/project/ruamel.yaml/
TAG_RUAMEL    := 0.17.21
FROM_RUAMEL   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,RUAMEL)

REPO_RUSTYAML := https://github.com/dtolnay/serde-yaml
TAG_RUSTYAML  := 0.8.26
FROM_RUSTYAML := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,RUSTYAML)

REPO_SNAKE    := https://bitbucket.org/snakeyaml/snakeyaml
TAG_SNAKE     := snakeyaml-1.30
FROM_SNAKE    := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,SNAKE)

REPO_SNAKEENG := https://bitbucket.org/snakeyaml/snakeyaml-engine
TAG_SNAKEENG  := 2.4-SNAPSHOT
FROM_SNAKEENG := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,SNAKEENG)

RUNTIMES := $(shell echo "$(RUNTIMES)" | tr A-Z a-z)
