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

WORKDIR /build

RUN git init --quiet \
 && git remote add origin $REPO \
 && git fetch origin $TAG \
 && git reset --hard FETCH_HEAD \
 && true

RUN cabal update \
 && cabal new-build exe:yaml2yeast

COPY bin/* /export/usr/local/bin/

RUN cp \
        dist-newstyle/build/x86_64-linux/ghc-8.4.3/YamlReference-0.10.0/x/yaml2yeast/build/yaml2yeast/yaml2yeast \
        /export/usr/local/bin/
