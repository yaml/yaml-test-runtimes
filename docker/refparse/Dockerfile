ARG FROM
FROM $FROM
ARG REPO
ARG TAG

WORKDIR /build

COPY bin/* /export/usr/local/bin/

RUN git init --quiet \
 && git remote add origin $REPO \
 && git fetch origin $TAG \
 && git reset --hard FETCH_HEAD \
 && true

RUN git fetch origin node_modules \
 && make node_modules \
 && rm -r node_modules/yaml \
 && mv node_modules /export/ \
 && true

RUN cp \
        javascript/bin/yaml-parser \
        /export/usr/local/bin/yaml-reference-parser.js \
 && cp \
        javascript/lib/* \
        /export/usr/local/lib/ \
 && true
