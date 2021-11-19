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
ifndef TAG
    $(error No TAG for $(NAME))
endif

CACHE := $(ROOT)/.git/cache

BUILD := $(CACHE)/yaml-test-$(NAME)-$(TAG)

DOCKER_USER ?= yamlio

ifdef IMAGE_$(VAR)
    DOCKER_IMAGE := $(DOCKER_USER)/$(IMAGE_$(VAR)):$(TAG)
else
    DOCKER_IMAGE := $(DOCKER_USER)/yaml-test-$(NAME):$(TAG)
endif
ifdef GIT_REPO
    DOCKER_ARGS += --build-arg REPO=$(GIT_REPO)
endif
DOCKER_ARGS += --build-arg TAG=$(TAG)

CMD ?= bash



default:

force:
	rm -f $(BUILD)

docker-build:: $(BUILD)

docker-shell:: docker-build
	touch /tmp/docker-bash-history
	docker run -it --rm \
	    -v $(ROOT):/host \
	    -v /tmp/docker-bash-history:/root/.bash_history \
	    -w /host \
	    $(DOCKER_IMAGE) \
	    $(CMD)

docker-push:: docker-build
	docker push $(DOCKER_IMAGE)


$(BUILD):
	docker build \
	    $(DOCKER_ARGS) \
	    -t $(DOCKER_IMAGE) .
	@mkdir -p $(dir $@)
	touch $@
