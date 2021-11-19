FROM nimlang/nim:1.6.0-alpine

ARG REPO
ARG TAG

RUN apk update \
 && apk add bash

RUN git clone --branch=v$TAG $REPO /build

WORKDIR /build

COPY src/ /src/

RUN nim c \
        -p:$PWD \
        -d:yamlScalarRepInd \
        /src/nimyaml_event.nim

RUN mkdir -p /export/usr/local/bin/ \
 && cp -P \
        /src/nimyaml_event \
        /export/usr/local/bin/yaml-test-parse-nimyaml \
 && true
