FROM yamlio/yaml-test-alpine:0.0.1

ARG REPO
ARG TAG

RUN git clone --branch=$TAG $REPO /build

WORKDIR /build

RUN ./bootstrap.sh \
 && ./configure \
 && make install

RUN cp -P \
        /usr/local/bin/fy-tool \
        /export/usr/local/bin/ \
 && cp -P \
        /usr/local/lib/libfyaml* \
        /export/usr/local/lib/ \
 && true
