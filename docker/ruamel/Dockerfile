FROM yamlio/yaml-test-alpine:0.0.1

ARG TAG

RUN apk add python3-dev

RUN pip install ruamel.yaml==$TAG

RUN mkdir -p /export/usr/lib/python3.9/site-packages \
 && cp -Pr \
        /usr/lib/python3.9/site-packages/* \
        /export/usr/lib/python3.9/site-packages/ \
 && true

COPY bin/* /export/usr/local/bin/
