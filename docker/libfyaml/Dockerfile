ARG FROM
FROM $FROM
ARG REPO
ARG TAG

RUN apk add linux-headers

WORKDIR /build

RUN git init --quiet \
 && git remote add origin $REPO \
 && git fetch origin $TAG \
 && git reset --hard FETCH_HEAD \
 && true

RUN ./bootstrap.sh \
 && ./configure \
 && make install

COPY bin/* /export/usr/local/bin/

RUN cp -P \
        /usr/local/bin/fy-tool \
        /export/usr/local/bin/ \
 && cp -P \
        /usr/local/lib/libfyaml* \
        /export/usr/local/lib/ \
 && true
