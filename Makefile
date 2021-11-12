include .common.mk

DOCKER_BUILD := \
    alpine \
    c \
    go \
    node \
    perl \
    python \
    main

DOCKER_DIRS := $(DOCKER_BUILD:%=docker/%)
DOCKER_BUILT := $(DOCKER_DIRS:%=%/BUILT)

CLEAN_TARGETS := $(DOCKER_BUILD:%=clean-%)


build: $(DOCKER_BUILT)

push shell: build
	make -C docker/main docker-$@

clean:: $(CLEAN_TARGETS)

yaml-reference-parser:
	git clone --branch=devel git@github.com:yaml/$@ $@

docker/%/BUILT: docker/%
	make -C $< docker-build

clean-%: docker/%
	make -C $< clean
