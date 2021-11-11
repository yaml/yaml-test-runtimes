FROM yamlio/alpine-builder:0.0.1

COPY go-yaml /yaml
COPY src /build

WORKDIR /build

RUN make all

RUN cp go-yaml-test /export/bin/
