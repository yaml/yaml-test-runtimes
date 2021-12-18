ARG FROM
FROM $FROM
ARG REPO
ARG TAG

RUN git clone --branch=$TAG $REPO /build

WORKDIR /build

RUN npm install . \
 && npm run build \
 && npm pack \
 && true

RUN mv yaml-* /tmp/ \
 && cd /tmp/ \
 && npm install --no-save yaml-* \
 && rm -f node_modules/yaml/package.json \
 && mv node_modules /export/ \
 && true

COPY bin/* /export/usr/local/bin/
