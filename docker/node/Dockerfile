FROM yamlio/alpine-builder:0.0.1

RUN apk add \
        nodejs \
        npm \
 && true

WORKDIR node

RUN npm install --save yaml

RUN mv node_modules /export/
