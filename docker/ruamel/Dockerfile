ARG FROM
FROM $FROM
ARG TAG

ENV PYTHON_VERSION=3.11

RUN apk add python3-dev

RUN pip install ruamel.yaml==$TAG

RUN mkdir -p /export/usr/lib/python$PYTHON_VERSION/site-packages \
 && cp -Pr \
        /usr/lib/python$PYTHON_VERSION/site-packages/* \
        /export/usr/lib/python$PYTHON_VERSION/site-packages/ \
 && true

COPY bin/* /export/usr/local/bin/
