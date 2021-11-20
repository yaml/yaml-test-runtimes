SHELL := bash

NAME ?= $(shell basename $(shell pwd))

VAR := $(shell perl -e '$$_=uc("$(NAME)");print')

ROOT := $(shell git rev-parse --show-toplevel)

include $(ROOT)/Content.mk

ifdef REPO_$(VAR)
    GIT_REPO := $(REPO_$(VAR))
endif
ifdef TAG_$(VAR)
    TAG := $(TAG_$(VAR))
endif

DOCKER_USER ?= yamlio

ifdef IMAGE_$(VAR)
    DOCKER_IMAGE := $(DOCKER_USER)/$(IMAGE_$(VAR)):$(TAG)
else
    DOCKER_IMAGE := $(DOCKER_USER)/yaml-test-$(NAME):$(TAG)
endif
ifdef FROM_$(VAR)
    DOCKER_ARGS += --build-arg FROM=$(FROM_$(VAR))
endif
ifdef GIT_REPO
    DOCKER_ARGS += --build-arg REPO=$(GIT_REPO)
endif
ifdef TAG
    DOCKER_ARGS += --build-arg TAG=$(TAG)
endif

CMD ?= bash



default:

docker-build::
	docker build \
	    $(DOCKER_ARGS) \
	    -t $(DOCKER_IMAGE) .

docker-shell::
	touch /tmp/docker-bash-history
	docker run -it --rm \
	    -v $(ROOT):/host \
	    -v /tmp/docker-bash-history:/root/.bash_history \
	    -w /host \
	    $(DOCKER_IMAGE) \
	    $(CMD)

docker-push::
	docker push $(DOCKER_IMAGE)
