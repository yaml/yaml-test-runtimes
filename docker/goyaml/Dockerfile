FROM yamlio/yaml-test-alpine:0.0.1

ARG REPO
ARG TAG

WORKDIR /yaml

RUN git init --quiet \
 && git remote add origin $REPO \
 && git fetch origin $TAG \
 && git reset --hard FETCH_HEAD \
 && true

COPY src /build

WORKDIR /build

RUN make build

RUN cp \
        go-yaml-test \
        /export/usr/local/bin/yaml-test-parse-goyaml \
 && true
