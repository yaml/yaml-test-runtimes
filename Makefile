include Content.mk


DOCKER_RUNTIMES := \
    dotnet \
    hsref \
    hsyaml \
    goyaml \
    libfyaml \
    libyaml \
    nimyaml \
    npmyaml \
    pyyaml \
    ruamel \
    snake \
    yamlpp \
    yamlref \

DOCKER_RUNTIMES := $(DOCKER_RUNTIMES:%=docker/%)

QMAKE := $(MAKE) --no-print-directory



build: docker/alpine $(DOCKER_RUNTIMES) docker/main

push shell: build
	$(QMAKE) -C docker/main -f ../Makefile docker-$@

test: build
	$(QMAKE) -C docker/main -f ../Makefile docker-shell \
	    CMD=test-yaml-runtimes

force:
	rm -fr .git/cache


docker/main: always
	$(QMAKE) -C $@ -f ../Makefile docker-build \
	    DOCKER_ARGS='$(DOCKER_BUILD_ARGS)'

docker/alpine $(DOCKER_RUNTIMES): always
	$(QMAKE) -C $@ -f ../Makefile docker-build

always:
