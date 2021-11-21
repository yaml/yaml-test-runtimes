SHELL := bash

NAME ?= $(shell basename $(shell pwd))

VAR := $(shell echo $(NAME) | tr a-z A-Z)

ROOT := $(shell git rev-parse --show-toplevel)

BUILT := $(ROOT)/.git/built
$(shell mkdir -p $(BUILT))

include $(ROOT)/Content.mk

DOCKER_USER ?= yamlio

ifdef TAG_$(VAR)
    TAG := $(TAG_$(VAR))
endif
ifdef TAG
    DOCKER_ARGS += --build-arg TAG=$(TAG)
endif
ifdef IMAGE_$(VAR)
    DOCKER_IMAGE := $(DOCKER_USER)/$(IMAGE_$(VAR)):$(TAG)
else
    DOCKER_IMAGE := $(DOCKER_USER)/yaml-test-$(NAME):$(TAG)
endif
ifdef REPO_$(VAR)
    DOCKER_ARGS += --build-arg REPO=$(REPO_$(VAR))
endif
ifdef FROM_$(VAR)
    DOCKER_ARGS += --build-arg FROM=$(FROM_$(VAR))
endif

BUILD := $(BUILT)/$(NAME)-$(TAG)
ifeq (main,$(NAME))
    DEPS := $(shell find $(ROOT)/docker)
else
    DEPS := $(shell find $(ROOT)/docker/$(NAME) -type f)
endif
BUILD += \
    $(ROOT)/Makefile \
    $(ROOT)/docker/Makefile \

CMD ?= bash

default:

force:
	rm -fr $(BUILD)

docker-build:: $(BUILD)

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

$(BUILD): $(DEPS)
	docker build \
	    $(DOCKER_ARGS) \
	    -t $(DOCKER_IMAGE) .
	touch $@
