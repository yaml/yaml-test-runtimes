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

CLEAN_TARGETS := $(DOCKER_BUILD:%=clean-%)


build: $(DOCKER_DIRS)

push shell: build
	make -C docker/main docker-$@

clean:: $(CLEAN_TARGETS)

yaml-reference-parser:
	git clone --branch=devel git@github.com:yaml/$@ $@

$(DOCKER_DIRS): force
	make -C $@ docker-build

clean-%: docker/%/
	make -C $< clean

force:
