ARG FROM
FROM $FROM
ARG REPO
ARG TAG

RUN apk update \
 && apk add \
        bash \
        cabal \
        g++ \
        ghc \
        git \
        musl \
        vim \
        wget \
 && true

RUN git clone --branch=$TAG $REPO /build

WORKDIR /build

RUN cabal update \
 && cabal new-build exe:yaml-test \
 && true

COPY bin/* /export/usr/local/bin/

RUN tag=$TAG \
 && cp \
        dist-newstyle/build/x86_64-linux/ghc-8.4.3/HsYAML-${tag#v}/x/yaml-test/build/yaml-test/yaml-test \
        /export/usr/local/bin/hsyaml-parser
