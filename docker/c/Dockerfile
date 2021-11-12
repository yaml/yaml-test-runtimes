FROM yamlio/alpine-builder:0.0.1

RUN git clone --branch=v0.7.2 https://github.com/pantoniou/libfyaml build

WORKDIR build

RUN ./bootstrap.sh \
 && ./configure \
 && make install

RUN cp -P /usr/local/bin/fy-tool /export/usr/local/bin/

RUN cp -P /usr/local/lib/libfyaml* /export/usr/local/lib/
