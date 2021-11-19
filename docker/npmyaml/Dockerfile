FROM yamlio/yaml-test-alpine-base:0.0.1

ARG REPO
ARG TAG

RUN apk add \
        nodejs \
        npm \
 && true

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
