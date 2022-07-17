include Config.mk

DOCKER_RUNTIMES := $(RUNTIMES:%=docker/%)

QMAKE := $(MAKE) --no-print-directory


default:

force:
	rm -fr .git/built/

build: docker/alpine $(DOCKER_RUNTIMES) docker/main

push shell: build
	$(QMAKE) -C docker/main $@

test: build
	$(QMAKE) -C docker/main shell \
	    CMD=test-yaml-runtimes

docker/main: always
	$(QMAKE) -C $@ build \
	    DOCKER_ARGS='--build-arg ALPINE=$(ALPINE) $(DOCKER_BUILD_ARGS)'

docker/alpine $(DOCKER_RUNTIMES): always
	$(QMAKE) -C $@ build

always:
