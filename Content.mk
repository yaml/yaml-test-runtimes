define add
    $(eval DOCKER_BUILD_ARGS += --build-arg $1=$$(TAG_$1))
    $(eval RUNTIMES += $1)
endef

# Final all runtimes image created by `make build`:
IMAGE_MAIN    := yaml-test-runtimes
TAG_MAIN      := 0.1.1

# Local Alpine builder base image:
ALPINE	      := 3.15
TAG_ALPINE    := 0.0.2
FROM_ALPINE   := alpine:$(ALPINE)

# YAML testing runtime sources:

REPO_REFPARSE := https://github.com/yaml/yaml-reference-parser
TAG_REFPARSE  := c4bc42e16cc5f4bd1d74adff08cfc8cd0f29998c
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
TAG_GOYAML    := 571fa4dbd242ebc69b88b8eb4f55c878465bb8b0
FROM_GOYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,GOYAML)

REPO_HSYAML   := https://github.com/haskell-hvr/HsYAML
TAG_HSYAML    := v0.2.1.0
FROM_HSYAML   := alpine:3.10.2
$(call add,HSYAML)

REPO_LIBFYAML := https://github.com/pantoniou/libfyaml
TAG_LIBFYAML  := v0.7.3
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
TAG_NIMYAML   := 0.16.0
FROM_NIMYAML  := nimlang/nim:1.6.0-alpine
$(call add,NIMYAML)

REPO_NPMYAML  := https://github.com/eemeli/yaml
TAG_NPMYAML   := v2.0.0-9
FROM_NPMYAML  := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,NPMYAML)

# Installed from CPAN
TAG_PPYAML    := 0.030
FROM_PPYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,PPYAML)

# Installed from PyPI
TAG_PYYAML    := 6.0
FROM_PYYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,PYYAML)

# Installed from PyPI
TAG_RUAMEL    := 0.17.17
FROM_RUAMEL   := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,RUAMEL)

REPO_SNAKE    := https://bitbucket.org/snakeyaml/snakeyaml
TAG_SNAKE     := 1ae5d5b705e19dab3344bd080a4ea08d69295fde
FROM_SNAKE    := yamlio/yaml-test-alpine:$(TAG_ALPINE)
$(call add,SNAKE)

RUNTIMES := $(shell echo "$(RUNTIMES)" | tr A-Z a-z)
