ARG FROM
FROM $FROM
ARG TAG

RUN apk add python3-dev

RUN pip install ruamel.yaml==$TAG

RUN mkdir -p /export/usr/lib/python3.9/site-packages \
 && cp -Pr \
        /usr/lib/python3.9/site-packages/* \
        /export/usr/lib/python3.9/site-packages/ \
 && true

COPY bin/* /export/usr/local/bin/
