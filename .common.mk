SHELL := bash

ROOT := $(shell git rev-parse --show-toplevel)

DOCKER_NS ?= yamlio
DOCKER_IMAGE := $(DOCKER_NS)/$(DOCKER_NAME):$(DOCKER_TAG)

default:

clean::
ifneq (,$(wildcard BUILT))
	rm -f BUILT
endif
ifdef DOCKER_DEPS
	rm -fr $(DOCKER_DEPS)
endif

docker-build:: $(DOCKER_DEPS)
	docker build -t $(DOCKER_IMAGE) .
	touch BUILT

docker-shell:: docker-build
	docker run -it --rm \
	    -v $(ROOT):/host \
	    -w /host \
	    $(DOCKER_IMAGE) \
	    bash

docker-push:: docker-build
	docker push $(DOCKER_IMAGE)
