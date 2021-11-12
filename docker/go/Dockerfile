FROM yamlio/alpine-builder:0.0.1

COPY src /build

RUN git clone --branch=v3-tester \
        https://github.com/pantoniou/yaml

WORKDIR /build

RUN make build

RUN cp go-yaml-test /export/usr/local/bin/
