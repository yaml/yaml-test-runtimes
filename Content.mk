# Final all runtimes image created by `make build`:
IMAGE_MAIN    := yaml-test-runtimes
TAG_MAIN      := 0.0.9

# Local Alpine builder base image:
ALPINE	      := 3.15
TAG_ALPINE    := 0.0.2
FROM_ALPINE   := alpine:$(ALPINE)


#------------------------------------------------------------------------------
# YAML testing runtime sources:

RUNTIMES      += dotnet
REPO_DOTNET   := https://github.com/aaubry/YamlDotNet
TAG_DOTNET    := 11.2.1
FROM_DOTNET   := mcr.microsoft.com/dotnet/core/sdk:3.1-alpine

RUNTIMES      += goyaml
REPO_GOYAML   := https://github.com/pantoniou/yaml
TAG_GOYAML    := 571fa4dbd242ebc69b88b8eb4f55c878465bb8b0
FROM_GOYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)

RUNTIMES      += hsref
REPO_HSREF    := https://github.com/orenbenkiki/yamlreference
TAG_HSREF     := bf471f804ccd014fcdded3a8c74c338df8f33c85
FROM_HSREF    := alpine:3.10.2

RUNTIMES      += hsyaml
REPO_HSYAML   := https://github.com/haskell-hvr/HsYAML
TAG_HSYAML    := v0.2.1.0
FROM_HSYAML   := alpine:3.10.2

RUNTIMES      += libfyaml
REPO_LIBFYAML := https://github.com/pantoniou/libfyaml
TAG_LIBFYAML  := v0.7.3
FROM_LIBFYAML := yamlio/yaml-test-alpine:$(TAG_ALPINE)

RUNTIMES      += libyaml
REPO_LIBYAML  := https://github.com/yaml/libyaml
TAG_LIBYAML   := 0.2.5
FROM_LIBYAML  := yamlio/yaml-test-alpine:$(TAG_ALPINE)

RUNTIMES      += nimyaml
REPO_NIMYAML  := https://github.com/flyx/NimYAML
TAG_NIMYAML   := 0.16.0
FROM_NIMYAML  := nimlang/nim:1.6.0-alpine

RUNTIMES      += npmyaml
REPO_NPMYAML  := https://github.com/eemeli/yaml
TAG_NPMYAML   := v2.0.0-9
FROM_NPMYAML  := yamlio/yaml-test-alpine:$(TAG_ALPINE)

RUNTIMES      += pyyaml
# Installed from PyPI
TAG_PYYAML    := 6.0
FROM_PYYAML   := yamlio/yaml-test-alpine:$(TAG_ALPINE)

RUNTIMES      += ruamel
# Installed from PyPI
TAG_RUAMEL    := 0.17.17
FROM_RUAMEL   := yamlio/yaml-test-alpine:$(TAG_ALPINE)

RUNTIMES      += snake
REPO_SNAKE    := https://bitbucket.org/snakeyaml/snakeyaml
TAG_SNAKE     := 1ae5d5b705e19dab3344bd080a4ea08d69295fde
FROM_SNAKE    := yamlio/yaml-test-alpine:$(TAG_ALPINE)

RUNTIMES      += yamlpp
# Installed from CPAN
TAG_YAMLPP    := 0.030
FROM_YAMLPP   := yamlio/yaml-test-alpine:$(TAG_ALPINE)

RUNTIMES      += yamlref
REPO_YAMLREF  := https://github.com/yaml/yaml-reference-parser
TAG_YAMLREF   := fcebce016650d97fd780095cb756467c2a572ba3
FROM_YAMLREF  := yamlio/yaml-test-alpine:$(TAG_ALPINE)
#------------------------------------------------------------------------------


# Build ARGs for building the main image:
DOCKER_BUILD_ARGS := \
    --build-arg DOTNET=$(TAG_DOTNET) \
    --build-arg GOYAML=$(TAG_GOYAML) \
    --build-arg HSREF=$(TAG_HSREF) \
    --build-arg HSYAML=$(TAG_HSYAML) \
    --build-arg LIBFYAML=$(TAG_LIBFYAML) \
    --build-arg LIBYAML=$(TAG_LIBYAML) \
    --build-arg NIMYAML=$(TAG_NIMYAML) \
    --build-arg NPMYAML=$(TAG_NPMYAML) \
    --build-arg PYYAML=$(TAG_PYYAML) \
    --build-arg RUAMEL=$(TAG_RUAMEL) \
    --build-arg SNAKE=$(TAG_SNAKE) \
    --build-arg YAMLPP=$(TAG_YAMLPP) \
    --build-arg YAMLREF=$(TAG_YAMLREF) \
