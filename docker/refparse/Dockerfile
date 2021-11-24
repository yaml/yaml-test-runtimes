ARG FROM
FROM $FROM
ARG REPO
ARG TAG

RUN cpanm -n XXX

WORKDIR /build

RUN git init --quiet \
 && git remote add origin $REPO \
 && git fetch origin $TAG \
 && git reset --hard FETCH_HEAD \
 && true

COPY bin/* /export/usr/local/bin/

RUN cp -r \
        /usr/local/share/perl5/site_perl/* \
        /export/usr/local/share/perl5/site_perl/ \
 && cp \
        perl/bin/yaml-parser \
        /export/usr/local/bin/yaml-reference-parser.pl \
 && cp -r \
        perl/lib/* \
        /export/usr/local/share/perl5/site_perl/ \
 && true
