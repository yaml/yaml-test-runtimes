ARG FROM
FROM $FROM
ARG TAG

RUN cpanm -n \
        boolean \
        YAML::PP@$TAG \
 && true

RUN cp -Pr \
        /usr/local/share/perl5/site_perl/* \
        /export/usr/local/share/perl5/site_perl/ \
 && true

COPY bin/* /export/usr/local/bin/
