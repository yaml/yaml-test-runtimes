ARG FROM
FROM $FROM
ARG REPO
ARG TAG

RUN git clone --branch=$TAG $REPO /build

WORKDIR /build

COPY src/ /src/

RUN cp /src/run-parser-test-suite.c tests/

RUN ./bootstrap \
 && ./configure \
 && make

COPY bin/* /export/usr/local/bin/

RUN cp -P \
        src/.libs/libyaml*so* \
        /export/usr/lib \
 && cp \
        tests/.libs/run-parser-test-suite \
        /export/usr/local/bin/libyaml-parser \
 && true
