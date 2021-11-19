# Final all runtimes image created by `make build`:
IMAGE_MAIN    := yaml-test-runtimes
TAG_MAIN      := 0.0.7

# Local Alpine builder base image:
TAG_ALPINE    := 0.0.1


#------------------------------------------------------------------------------
# YAML testing runtime sources:

REPO_DOTNET   := https://github.com/aaubry/YamlDotNet
TAG_DOTNET    := 11.2.1

REPO_GOYAML   := https://github.com/pantoniou/yaml
TAG_GOYAML    := 571fa4dbd242ebc69b88b8eb4f55c878465bb8b0

REPO_HSREF    := https://github.com/orenbenkiki/yamlreference
TAG_HSREF     := bf471f804ccd014fcdded3a8c74c338df8f33c85

REPO_HSYAML   := https://github.com/haskell-hvr/HsYAML
TAG_HSYAML    := v0.2.1.0

REPO_LIBFYAML := https://github.com/pantoniou/libfyaml
TAG_LIBFYAML  := v0.7.3

REPO_LIBYAML  := https://github.com/yaml/libyaml
TAG_LIBYAML   := 0.2.5

REPO_NIMYAML  := https://github.com/flyx/NimYAML
TAG_NIMYAML   := 0.16.0

REPO_NPMYAML  := https://github.com/eemeli/yaml
TAG_NPMYAML   := v2.0.0-9

# Installed from PyPI
TAG_PYYAML    := 6.0

# Installed from PyPI
TAG_RUAMEL    := 0.17.17

REPO_SNAKE    := https://bitbucket.org/snakeyaml/snakeyaml
TAG_SNAKE     := 1ae5d5b705e19dab3344bd080a4ea08d69295fde

# Installed from CPAN
TAG_YAMLPP    := 0.030

REPO_YAMLREF  := https://github.com/yaml/yaml-reference-parser
TAG_YAMLREF   := fcebce016650d97fd780095cb756467c2a572ba3
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
