FROM yamlio/alpine-builder:0.0.1

RUN apk add python3-dev

RUN pip install \
        pyyaml \
        ruamel.yaml \
 && true

RUN mkdir -p /export/usr/lib/python3.9/site-packages \
 && cp -Pr /usr/lib/python3.9/site-packages/* \
           /export/usr/lib/python3.9/site-packages/ \
 && true
